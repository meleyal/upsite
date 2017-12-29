class Image < Block
  ATTACHMENT_QUOTA = 1000

  # TODO: one of these should be present
  validates :embed_url, format: /https?:\/\/.*/, allow_blank: true
  validates :link_url, format: /https?:\/\/.*/, allow_blank: true
  validate :validate_attachment_quota

  def editable?
    true
  end

  def attachment
    attachments.first
  end

  def original
    attachments.first.upload.url(:original) rescue nil
  end

  def medium
    attachments.first.upload.url(:medium) rescue nil
  end

  def medium_2x
    attachments.first.upload.url(:medium_2x) rescue nil
  end

  # TODO: Get quota from Plan
  def validate_attachment_quota
    if self.attachments.present? && self.site.attachments.count > ATTACHMENT_QUOTA
      errors.add(:attachments, 'Upload limit reached')
    end
  end
end
