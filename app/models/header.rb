class Header < Block
  store :data, accessors: [:text, :background_color]

  def to_partial_path
    'blocks/header/showbox'
  end

  def image
    attachments.first.upload.url rescue nil
  end
end
