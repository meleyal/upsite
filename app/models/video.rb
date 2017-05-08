class Video < Block
  validates :embed_url,
    presence: true,
    format: { with: /\A<iframe.*(youtube|vimeo)/, message: 'is invalid (embed code required)' }
end
