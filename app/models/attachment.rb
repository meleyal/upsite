class Attachment < ActiveRecord::Base
  belongs_to :block

  has_attached_file :upload,
    path: ":rails_root/public/system/:app_name_:hash_:style.:extension",
    url: "/system/:app_name_:hash_:style.:extension",
    hash_data: ":class/:attachment/:id/:style",
    hash_secret: "QXBhFYdt2JU7ZINf",
    styles: {
      original: '1000>',
      medium: { geometry: '300x300#', processors: [:papercrop] },
      medium_2x: { geometry: '600x600#', processors: [:papercrop] },
    },
    source_file_options: { all: '-auto-orient' },
    convert_options: { all: "-quality 75 -strip" }

  crop_attached_file :upload

  validates_attachment :upload,
    presence: true,
    content_type: { content_type: ['image/jpeg', 'image/gif', 'image/png'] },
    size: { less_than: 8.megabytes }

  def geometry
    Paperclip::Geometry.from_file(Paperclip.io_adapters.for(upload))
  end
end
