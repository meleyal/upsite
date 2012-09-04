class Text < Widget

  def as_json(options = {})
    {
      id:       self.id,
      position: self.position,
      type:     self.type,
      title:    self.data['title'],
      body:     self.data['body']      
    }
  end

end