class Invite < ActiveRecord::Base
  belongs_to :sender, :class_name => 'User'

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :recipient_email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validate :recipient_is_not_registered
  validate :sender_has_invites, :if => :sender

  before_create :generate_token

  def accepted?
    User.find_by(email: self.recipient_email)
  end

  def accepted_at
    User.find_by(email: self.recipient_email).created_at
  end

  private

  def recipient_is_not_registered
    errors.add :recipient_email, 'is already registered' if User.find_by(email: recipient_email)
  end

  def sender_has_invites
    if sender.invites.count >= sender.plan.invite_limit
      errors.add_to_base 'You have reached your limit of invites to send.'
    end
  end

  def generate_token
    self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end
end
