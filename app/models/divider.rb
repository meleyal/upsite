class Divider < Widget
  include RankedModel
  store :data, accessors: [:title]
  ranks :sort_order, :class_name => 'Widget'
  
  def to_partial_path
    'widgets/divider/divider'
  end
end
