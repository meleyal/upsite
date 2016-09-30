class Plan < ActiveRecord::Base
  has_many :users

  def self.pro
    self.find_by(code: 'pro')
  end

  def self.free
    self.find_by(code: 'free')
  end
end
