class Attachment < ActiveRecord::Base
  belongs_to :widget

  has_attached_file :upload,
    url: "/system/:app_name_:hash_:style.:extension",
    hash_secret: "QXBhFYdt2JU7ZINf",
    styles: { medium: '300x300#' }
  
  validates_attachment_content_type :upload, :content_type => /\Aimage\/.*\Z/

  def upload_url
    upload.url :medium
  end
end
