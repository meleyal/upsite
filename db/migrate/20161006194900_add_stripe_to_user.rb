class AddStripeToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :stripe_customer_id
      t.index :stripe_customer_id
    end
  end
end
