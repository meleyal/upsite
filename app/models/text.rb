class Text < Block
  validates :body, presence: true, length: { maximum: 600 }
end
