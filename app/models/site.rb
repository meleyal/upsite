class Site < ActiveRecord::Base
  
  has_many :widgets, :dependent => :destroy, :order => :position
  has_many :texts
  # has_many :images
  
end
