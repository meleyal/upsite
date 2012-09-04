class Widget < ActiveRecord::Base

  belongs_to :site  
  serialize :data #, JSON
  attr_accessible :type, :position, :position_position, :data

  include RankedModel
  ranks :position
  default_scope rank(:position)

end