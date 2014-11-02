class Page < ActiveRecord::Base
  before_create { self.subdomain = name.parameterize }
  has_many :users, dependent: :destroy
  belongs_to :owner, class_name: 'User'
  accepts_nested_attributes_for :owner
  validates :name, presence: true
  validates :subdomain, uniqueness: true

  # has_many :widgets, :dependent => :destroy, -> { order(:sort_order) }
  has_many :widgets, -> { order(:sort_order) }
  has_many :texts
  has_many :images
  has_many :headers
  has_many :dividers
  has_many :navigations
  has_many :downloads

  store :settings, accessors: [:font, :background_color, :theme_color, :custom_css, :cc_number, :cc_type, :cc_cvc]

end
