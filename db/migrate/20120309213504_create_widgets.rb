class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :type
      t.integer :position
      t.text :data
      t.references :site
      t.timestamps
    end
    add_index :widgets, :site_id
  end
end
