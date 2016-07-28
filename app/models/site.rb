class Site < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  accepts_nested_attributes_for :owner
  has_many :site_memberships, dependent: :destroy
  has_many :users, through: :site_memberships
  has_many :attachments, through: :blocks
  has_many :blocks, -> { order(:position) }, dependent: :destroy
  has_many :texts
  has_many :images
  has_many :videos
  has_many :audios
  has_many :maps
  has_many :spaces

  scope :active, -> { where(deleted_at: nil) }
  scope :pro, -> { joins(:users).where(users: { plan_id: 2 }) }
  scope :dormant, -> {
    joins('LEFT OUTER JOIN blocks ON blocks.site_id = sites.id').
    select('sites.*').
    group('sites.id').
    having('count(blocks.id) <= 2')
  }

  before_validation(on: :create) {
    subdomain = self.name[0..60].gsub(/'/, '').parameterize
    if Site.find_by(subdomain: subdomain)
      self.subdomain = "#{subdomain}#{Site.maximum(:id) + 1}"
    else
      self.subdomain = subdomain
    end
  }
  validates :name, presence: true
  validates :subdomain, {
    presence: true,
    uniqueness: true,
    length: { :within => 1..60 },
    format: { :with => /[a-z0-9\-]+/ },
    exclusion: %w(www ftp mail pop smtp admin ssl sftp api development stage test demo upsite ads)
  }
  validates :color, format: /#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})/, allow_blank: true
  validates :description, length: { maximum: 600 }
end
