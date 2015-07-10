class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :subdomain
      t.string :domain
      t.jsonb :settings, null: false, default: '{}'
      t.string :owner_id
      t.timestamp :deleted_at

      t.timestamps null: false
    end
    add_index :sites, :owner_id, unique: true
    add_index :sites, :subdomain, unique: true
    add_index :sites, :settings, using: :gin
  end
end
