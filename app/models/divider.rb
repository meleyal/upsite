class Divider < Block
  store :data, accessors: [:title]

  def to_partial_path
    'blocks/divider/divider'
  end
end
