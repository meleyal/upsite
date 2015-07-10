class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, index: true, unique: true
      t.string :password_digest
      t.string :remember_token, index: true
      t.string :first_name
      t.string :last_name
      t.references :plan, index: true
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
