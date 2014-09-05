class Text < Widget
  include RankedModel
  store :data, accessors: [:title, :body]
  ranks :sort_order, :class_name => 'Widget'
  
  def to_partial_path
    'widgets/text'
  end
end
