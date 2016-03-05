class Video < Block
  validates :embed_url, format: /https?:\/\/.*(youtube|vimeo)/
end
