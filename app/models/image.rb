class Image < Block
  ATTACHMENT_QUOTA = 5

  validates :embed_url, format: /https?:\/\/.*/, allow_blank: true
  validates :link_url, format: /https?:\/\/.*/, allow_blank: true
  validate :validate_attachment_quota

  def image
    attachments.first.upload.url(:medium) rescue nil
  end

  def validate_attachment_quota
    if self.attachments.present? && self.site.attachments.count > ATTACHMENT_QUOTA
      errors.add(:attachments, 'Upload limit reached') 
    end
  end
end
