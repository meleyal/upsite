class Text < Block
  store :data, accessors: [:title, :body, :layout]

  def to_partial_path
    'blocks/text/text'
  end
end
