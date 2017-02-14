class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :token
      t.string :recipient_email
      t.integer :sender_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
