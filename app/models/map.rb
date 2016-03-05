class Map < Block
  validates :embed_url, format: /https?:\/\/.*google/
end
