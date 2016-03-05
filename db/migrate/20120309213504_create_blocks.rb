class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :type
      t.integer :position
      t.string :title
      t.text :body
      t.string :link_url
      t.string :embed_url
      t.string :color
      t.references :site
      t.timestamps
    end
    add_index :blocks, :site_id
  end
end
