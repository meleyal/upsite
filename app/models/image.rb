class Image < Block
  include RankedModel
  ranks :sort_order, :class_name => 'Block'
end
