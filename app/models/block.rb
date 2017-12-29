class Block < ActiveRecord::Base
  belongs_to :site, touch: true

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

  def embed_src
    self.embed_url.match(/src\s*=\s*"(.+?)"/)[1] rescue ''
  end
end
