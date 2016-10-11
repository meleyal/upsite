class User < ActiveRecord::Base
  ##
  # Callbacks
  #
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  after_create :create_subscription, :send_analytics_email
  before_destroy :destroy_subscription

  ##
  # Associations
  #
  has_many :site_memberships, dependent: :destroy
  has_many :sites, through: :site_memberships
  has_one :subscription
  has_one :plan, through: :subscription

  ##
  # Validations
  #
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :password, length: { minimum: 6 }, presence: true, on: :create
  # validates :password_confirmation, presence: true
  validates :terms, acceptance: true
  attr_accessor :terms

  ##
  # Class methods
  #
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  ##
  # Instance methods
  #
  def site
    self.sites.active.first
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
    customer = Stripe::Customer.retrieve(self.stripe_customer_id)
    subscription = Stripe::Subscription.retrieve(customer.subscriptions.first.id)
    subscription.plan = plan.code
    subscription.prorate = false
    subscription.save
    self.subscription.update(plan: plan, ends_at: Time.at(subscription.current_period_end))
  end

  private

  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end

  def create_subscription
    Subscription.create(user: self, plan: Plan.free, starts_at: Time.now)
    customer = Stripe::Customer.create(email: self.email, plan: Plan.free.code)
    self.update(stripe_customer_id: customer.id)
  end

  def destroy_subscription
    self.subscription.destroy
    customer = Stripe::Customer.retrieve(self.stripe_customer_id)
    customer.delete
  end

  def send_analytics_email
    NotificationsMailer.analytics_email(:signup, self).deliver_now
  end
end
