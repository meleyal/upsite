class Download < Widget
  store :data, accessors: [:title]
  
  def to_partial_path
    'widgets/download/download'
  end
end
