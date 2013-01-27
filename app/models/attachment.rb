class Attachment < ActiveRecord::Base

  belongs_to :site

  has_attached_file :upload, {
    url: "/uploads/:site_id/:hash_:style.:extension",
    hash_secret: "QXBhFYdt2JU7ZINf",
    styles: { medium: '300x300#' }
  }

  def upload_url
    upload.url :medium
  end

  def as_json(options={})
    super only: [:id], methods: [:upload_url]
  end

end
