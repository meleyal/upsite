class RemoveCruft < ActiveRecord::Migration
  def change
    remove_column :blocks, :size, :string

    change_table :users do |t|
      t.remove :first_name, :last_name, :deleted_at, :stripe_customer_id
    end

    change_table :sites do |t|
      t.remove :body, :featured, :deleted_at
    end
  end
end
