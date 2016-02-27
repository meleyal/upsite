class Block < ActiveRecord::Base
  include RankedModel

  belongs_to :site
  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments

  ranks :sort_order, :class_name => 'Block'
  default_scope { rank(:sort_order) }

  def to_partial_path
    type = self.type.downcase
    "blocks/#{type}/#{type}"
  end
end
