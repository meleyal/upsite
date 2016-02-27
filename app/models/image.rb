class Image < Block
  def image
    attachments.first.upload.url(:medium) rescue nil
  end
end
