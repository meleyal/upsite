class SiteMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :site, dependent: :destroy
end
