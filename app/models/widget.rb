class Widget < ActiveRecord::Base

  belongs_to :site
  serialize :data #, JSON
  attr_accessible :type, :sort_order, :sort_order_position, :data, :site_id

  include RankedModel
  ranks :sort_order
  default_scope rank(:sort_order)

end
