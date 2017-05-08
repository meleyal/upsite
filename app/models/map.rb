class Map < Block
  validates :embed_url,
    presence: true,
    format: { with: /\A<iframe.*(google)/, message: 'is invalid (embed code required)' }
end
