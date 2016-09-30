class AddCostPerMonthToPlan < ActiveRecord::Migration
  def change
    add_column :plans, :cost_per_month, :integer
    remove_column :plans, :cost_per_year, :decimal
  end
end
