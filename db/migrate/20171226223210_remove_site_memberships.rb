class RemoveSiteMemberships < ActiveRecord::Migration
  def change
    drop_table :site_memberships do |t|
    end

    remove_column :sites, :owner_id, :string
    add_reference :sites, :owner
  end
end
