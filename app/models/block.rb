class Block < ActiveRecord::Base
  include RankedModel

  belongs_to :site
  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments

  # serialize :data
  ranks :sort_order, :class_name => 'Block'
  default_scope { rank(:sort_order) }

end
