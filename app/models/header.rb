class Header < Widget
  store :data, accessors: [:title]
  
  def to_partial_path
    'widgets/header/header'
  end
end
