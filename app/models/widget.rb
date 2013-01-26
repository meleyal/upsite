class Widget < ActiveRecord::Base

  include RankedModel

  belongs_to :site
  serialize :data
  attr_accessible :type, :sort_order, :sort_order_position, :data, :site_id

  ranks :sort_order
  default_scope rank(:sort_order)

end
