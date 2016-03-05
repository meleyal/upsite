class Audio < Block
  validates :embed_url, format: /https?:\/\/.*soundcloud|bandcamp|spotify/, presence: true
end
