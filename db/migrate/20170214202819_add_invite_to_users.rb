class AddInviteToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references :invite, index: true
    end
  end
end
