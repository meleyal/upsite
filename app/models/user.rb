class User < ActiveRecord::Base
  belongs_to :page
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  has_secure_password
  validates :password, length: { minimum: 6 }, presence: true
  validates :password_confirmation, presence: true
end
