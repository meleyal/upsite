class Image < Block
  # TODO: one of these should be present
  validates :embed_url, format: /https?:\/\/.*/, allow_blank: true
  validates :link_url, format: /https?:\/\/.*/, allow_blank: true

  def editable?
    true
  end
end
