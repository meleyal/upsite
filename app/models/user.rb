class User < ActiveRecord::Base
  ##
  # Callbacks
  #
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  after_create :create_subscription
  before_destroy :destroy_subscription, :destroy_sites

  ##
  # Associations
  #
  has_many :sites, foreign_key: :owner_id
  has_one :subscription
  has_one :plan, through: :subscription
  has_many :invites, class_name: 'Invite', foreign_key: 'sender_id'
  belongs_to :invite

  ##
  # Validations
  #
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :password, length: { minimum: 6 }, presence: true, on: :create
  validates :terms, acceptance: true
  attr_accessor :terms, :reset_token

  ##
  # Class methods
  #
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  ##
  # Instance methods
  #
  def site
    self.sites.first
  end

  def pro?
    self.plan.promo? || self.plan.pro? && !self.subscription.expired?
  end

  def promo?
    self.plan.promo?
  end

  def sudo?
    self.id == 1
  end

  def change_plan!(plan)
    self.subscription.update(plan: plan)
  end

  def send_password_reset_email
    NotificationsMailer.password_reset_email(self).deliver_now
  end

  def create_password_reset_token
    self.reset_token = User.new_token
    update_attribute(:password_reset_token,  User.digest(reset_token))
    update_attribute(:password_reset_sent_at, Time.zone.now)
  end

  private

  def create_remember_token
    self.remember_token = User.digest(User.new_token)
  end

  def create_subscription
    Subscription.create(user: self, plan: Plan.free, starts_at: Time.now)
  end

  def destroy_subscription
    self.subscription.destroy
  end

  def destroy_sites
    self.sites.destroy_all
  end
end
