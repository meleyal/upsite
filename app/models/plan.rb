class Plan < ActiveRecord::Base
  has_many :subscriptions
  has_many :users, through: :subscriptions

  def self.pro
    self.find_by(code: 'pro')
  end

  def self.promo
    self.find_by(code: 'promo')
  end

  def self.free
    self.find_by(code: 'free')
  end

  def pro?
    self.code.match(/pro/)
  end

  def promo?
    self.code == 'promo'
  end
end
