class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :subdomain
      t.text :settings
      t.integer :owner_id

      t.timestamps
    end
    add_index :pages, :subdomain, unique: true
  end
end
