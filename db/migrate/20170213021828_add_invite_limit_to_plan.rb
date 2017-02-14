class AddInviteLimitToPlan < ActiveRecord::Migration
  def change
    change_table :plans do |t|
      t.integer :invite_limit
    end
  end
end
