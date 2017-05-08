class Audio < Block
  validates :embed_url,
    presence: true,
    format: { with: /\A<iframe.*(soundcloud|bandcamp|spotify)/, message: 'is invalid (embed code required)' }
end
