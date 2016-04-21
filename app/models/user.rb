class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  after_create :add_to_mailing_list

  has_many :site_memberships, dependent: :destroy
  has_many :sites, through: :site_memberships
  belongs_to :plan

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  has_secure_password
  validates :password, length: { minimum: 6 }, presence: true, on: :create
  validates :terms, acceptance: true
  attr_accessor :terms
  # validates :password_confirmation, presence: true

  def site
    self.sites.first
  end

  def pro?
    plan.code != 'free'
  end

  def sudo?
    self.id == 1
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end

    def add_to_mailing_list
      client = Mailchimp::API.new(ENV['MAILCHIMP_API_KEY'])
      client.lists.subscribe(ENV['MAILCHIMP_LIST_ID'], { email: self.email }, nil, email_type = 'text', double_optin = false)
    end
end
