class Attachment < ActiveRecord::Base

  has_attached_file :upload, styles: { medium: '300x300#' }
  belongs_to :site

  def upload_url
    upload.url :medium
  end

  def as_json(options={})
    super only: [:id], methods: [:upload_url]
  end

end
