class Navigation < Block
  store :data, accessors: [:title, :body]

  def to_partial_path
    'blocks/navigation/navigation'
  end
end
