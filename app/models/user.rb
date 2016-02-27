class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token

  has_many :site_memberships, dependent: :destroy
  has_many :sites, through: :site_memberships
  belongs_to :plan

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  has_secure_password
  validates :password, length: { minimum: 6 }, presence: true
  # validates_acceptance_of :terms
  validates :terms, acceptance: true
  attr_accessor :terms
  # validates :password_confirmation, presence: true

  def pro?
    plan.code != 'free'
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
end
