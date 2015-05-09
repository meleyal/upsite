class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :type
      t.integer :sort_order
      t.text :data
      t.references :page
      t.timestamps
    end
    add_index :blocks, :page_id
  end
end
