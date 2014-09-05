class Image < Widget
  include RankedModel
  ranks :sort_order, :class_name => 'Widget'
end
