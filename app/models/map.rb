class Map < Block
  validates :embed_url, format: /https?:\/\/.*google/, presence: true
end
