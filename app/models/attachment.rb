class Attachment < ActiveRecord::Base
  belongs_to :block

  has_attached_file :upload,
    path: ":rails_root/public/system/:app_name_:hash_:style.:extension",
    url: "/system/:app_name_:hash_:style.:extension",
    hash_secret: "QXBhFYdt2JU7ZINf",
    styles: { medium: '300x300#' }

  validates_attachment_content_type :upload, :content_type => ["image/jpeg", "image/gif", "image/png"]

  def upload_url
    upload.url :medium
  end
end
