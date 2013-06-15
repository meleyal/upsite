class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :subdomain
      t.text :settings

      t.timestamps
    end
  end
end
