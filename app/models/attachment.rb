class Attachment < ActiveRecord::Base

  belongs_to :widget
  # before_post_process :skip_for_documents

  has_attached_file :upload,
    url: "/system/:app_name_:hash_:style.:extension",
    hash_secret: "QXBhFYdt2JU7ZINf"
    # styles: { medium: '300x300#' }
  
  # validates_attachment_content_type :upload, :content_type => ["image/jpeg", "image/gif", "image/png", "application/pdf"]

  # def skip_for_documents
  #   ! %w(application/pdf).include?(upload_content_type)
  # end

  def upload_url
    upload.url :medium
  end

end
