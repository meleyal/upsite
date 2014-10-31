class Widget < ActiveRecord::Base
  include RankedModel
  belongs_to :page
  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments
  serialize :data
  ranks :sort_order
  default_scope { rank(:sort_order) }
end
