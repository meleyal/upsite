class RemovePlans < ActiveRecord::Migration
  def change
    drop_table :plans do |t|
    end

    remove_column :users, :plan_id
  end
end
