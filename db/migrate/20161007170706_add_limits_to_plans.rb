class AddLimitsToPlans < ActiveRecord::Migration
  def up
    change_table :plans do |t|
      t.integer :site_limit
      t.integer :block_limit
      t.remove :open_for_registration
    end
  end

  def down
    change_table :plans do |t|
      t.remove :site_limit
      t.remove :block_limit
      t.boolean :open_for_registration
    end
  end
end
