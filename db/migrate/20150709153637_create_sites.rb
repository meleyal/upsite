class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :description
      t.string :subdomain
      t.string :domain
      t.string :color
      t.boolean :featured
      t.string :owner_id
      t.timestamp :deleted_at

      t.timestamps null: false
    end
    add_index :sites, :owner_id
    add_index :sites, :subdomain, unique: true
  end
end
