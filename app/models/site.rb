class Site < ActiveRecord::Base

  has_many :widgets, :dependent => :destroy, :order => :sort_order
  has_many :texts
  has_many :images
  has_many :attachments, :dependent => :destroy

end
