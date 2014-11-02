class Text < Widget
  store :data, accessors: [:title, :body, :layout]
  
  def to_partial_path
    'widgets/text/text'
  end
end
