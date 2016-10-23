class AddBodyToSite < ActiveRecord::Migration
  def change
    add_column :sites, :body, :text
  end
end
