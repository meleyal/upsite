class Site < ActiveRecord::Base

  ##
  # Attributes
  #

  ##
  # Associations
  #

  belongs_to :owner, class_name: 'User'
  accepts_nested_attributes_for :owner
  has_many :site_memberships, dependent: :destroy
  has_many :users, through: :site_memberships
  has_many :blocks, -> { order(:sort_order) }, dependent: :destroy
  has_many :texts
  has_many :images
  has_many :videos
  has_many :embeds
  has_many :blanks

  ##
  # Validations & Callbacks
  #

  scope :active, -> { where(deleted_at: nil) }

  before_validation { self.subdomain = name.parameterize }

  validates :name, presence: true
  validates :subdomain, { uniqueness: true, exclusion: { in: %w(www app api admin mail ftp development stage test demo) } }

end
