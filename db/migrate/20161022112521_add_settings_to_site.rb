class AddSettingsToSite < ActiveRecord::Migration
  def change
    add_column :sites, :settings, :jsonb, null: false, default: '{}'
    add_index  :sites, :settings, using: :gin
    remove_column :sites, :border, :boolean
  end
end
