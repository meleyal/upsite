class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :type
      t.integer :sort_order
      t.text :body
      t.string :url
      t.string :color
      t.references :site
      t.timestamps
    end
    add_index :blocks, :site_id
  end
end
