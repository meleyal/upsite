class Header < Widget
  include RankedModel
  store :data, accessors: [:title]
  ranks :sort_order, :class_name => 'Widget'
  
  def to_partial_path
    'widgets/header/header'
  end
end
