class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.string :code
      t.boolean :open_for_registration
      t.decimal :cost_per_year

      t.timestamps null: false
    end
  end
end
