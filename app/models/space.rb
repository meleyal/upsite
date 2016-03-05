class Space < Block
  validates :color, format: /#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})/
end
