class Site < ActiveRecord::Base

  ##
  # Attributes
  #

  store :settings, accessors: [:font, :theme_color, :custom_css, :cc_number, :cc_type, :name, :description]

  ##
  # Associations
  #

  belongs_to :owner, class_name: 'User'
  accepts_nested_attributes_for :owner
  has_many :site_memberships, dependent: :destroy
  has_many :users, through: :site_memberships
  has_many :blocks, -> { order(:sort_order) }, dependent: :destroy
  # has_many :widgets, :dependent => :destroy, -> { order(:sort_order) }
  # has_many :texts
  # has_many :images

  ##
  # Validations & Callbacks
  #

  before_validation { self.subdomain = name.parameterize }

  validates :name, presence: true
  validates :subdomain, { uniqueness: true, exclusion: { in: %w(www app api admin mail ftp development stage test demo) } }

end
