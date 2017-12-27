class Plan < ActiveRecord::Base
  has_many :users

  def self.pro
    self.find_by(code: 'pro_10')
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
