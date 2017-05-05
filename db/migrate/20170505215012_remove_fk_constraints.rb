class RemoveFkConstraints < ActiveRecord::Migration
  def change
    remove_foreign_key :subscriptions, :plan
    remove_foreign_key :subscriptions, :user
  end
end
