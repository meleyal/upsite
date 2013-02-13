class AddSettingsToSites < ActiveRecord::Migration
  def change
    add_column :sites, :settings, :string
  end
end
