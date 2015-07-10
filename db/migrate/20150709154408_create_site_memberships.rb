class CreateSiteMemberships < ActiveRecord::Migration
  def change
    create_table :site_memberships do |t|
      t.references :user, index: true, foreign_key: true
      t.references :site, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
