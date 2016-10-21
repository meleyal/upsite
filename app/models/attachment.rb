class Attachment < ActiveRecord::Base
  belongs_to :block

  has_attached_file :upload,
    path: ":rails_root/public/system/:app_name_:hash_:style.:extension",
    url: "/system/:app_name_:hash_:style.:extension",
    hash_data: ":class/:attachment/:id/:style",
    hash_secret: "QXBhFYdt2JU7ZINf",
    styles: { medium: '300x300#', medium_2x: '600x600#' }

  validates_attachment :upload,
    presence: true,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
    size: { less_than: 4.megabytes }
end
