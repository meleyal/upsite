class Download < Block
  store :data, accessors: [:title]

  def to_partial_path
    'blocks/download/download'
  end
end
