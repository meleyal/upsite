class AddBorderToSite < ActiveRecord::Migration
  def change
    add_column :sites, :border, :boolean, default: true
  end
end
