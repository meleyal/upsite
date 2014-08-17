class Page < ActiveRecord::Base

  # has_many :widgets, :dependent => :destroy, -> { order(:sort_order) }
  has_many :widgets, -> { order(:sort_order) }
  has_many :texts
  has_many :images
  has_many :attachments, :dependent => :destroy

  store :settings, accessors: [:background_color]
  # attr_accessible :settings

end
