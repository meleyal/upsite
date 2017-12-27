class RemoveSubscriptions < ActiveRecord::Migration
  def change
    drop_table :subscriptions do |t|
    end

    add_reference :users, :plan
  end
end
