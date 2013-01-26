class Image < Widget

  include RankedModel
  ranks :sort_order, :class_name => 'Widget'

  def as_json(options={})
    super only: [:id, :type, :sort_order, :data]
  end

end
