class AddSizeToBlocks < ActiveRecord::Migration
  def change
    change_table :blocks do |t|
      t.string :size
    end
  end
end
