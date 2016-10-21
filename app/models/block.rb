class Block < ActiveRecord::Base
  belongs_to :site, touch: true
  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments

  before_create {
    self.position = (self.site.blocks.maximum(:position) || 0) + 1
  }

  def to_partial_path
    type = self.type.downcase
    "blocks/#{type}/#{type}"
  end

  def editable?
    true
  end
end
