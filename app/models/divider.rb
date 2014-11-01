class Divider < Widget
  store :data, accessors: [:title]
  
  def to_partial_path
    'widgets/divider/divider'
  end
end
