class Navigation < Widget
  store :data, accessors: [:title, :body]
  
  def to_partial_path
    'widgets/navigation/navigation'
  end
end
