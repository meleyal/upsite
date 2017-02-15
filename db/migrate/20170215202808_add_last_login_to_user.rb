class AddLastLoginToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.timestamp :last_login_at
    end
  end
end
