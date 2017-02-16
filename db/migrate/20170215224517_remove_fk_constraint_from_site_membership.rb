class RemoveFkConstraintFromSiteMembership < ActiveRecord::Migration
  def change
    remove_foreign_key :site_memberships, :site
    remove_foreign_key :site_memberships, :user
  end
end
