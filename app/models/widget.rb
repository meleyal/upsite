class Widget < ActiveRecord::Base
  include RankedModel
  belongs_to :page
  serialize :data
  ranks :sort_order
  default_scope { rank(:sort_order) }
end
