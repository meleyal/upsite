class Text < Widget

  def as_json(options = {})
    {
      id:         self.id,
      sort_order: self.sort_order,
      type:       self.type,
      title:      self.data[:title],
      body:       self.data[:body]
    }
  end

end
