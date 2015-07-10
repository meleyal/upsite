class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :type
      t.integer :sort_order
      t.jsonb :data, null: false, default: '{}'
      t.references :site
      t.timestamps
    end
    add_index :blocks, :site_id
    add_index :blocks, :data, using: :gin
  end
end
