class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :type
      t.integer :sort_order
      t.text :data
      t.references :page
      t.timestamps
    end
    add_index :widgets, :page_id
  end
end
