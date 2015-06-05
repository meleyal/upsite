class Page < ActiveRecord::Base
  before_create { self.subdomain = name.parameterize }
  has_many :users, dependent: :destroy
  belongs_to :owner, class_name: 'User'
  accepts_nested_attributes_for :owner
  validates :name, presence: true
  validates :subdomain, uniqueness: true

  store :settings, accessors: [:font, :theme_color, :custom_css, :cc_number, :cc_type, :name, :description]

  # has_many :widgets, :dependent => :destroy, -> { order(:sort_order) }
  has_many :blocks, -> { order(:sort_order) }
  has_many :texts
  has_many :images
end
