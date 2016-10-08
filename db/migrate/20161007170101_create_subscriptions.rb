class CreateSubscriptions < ActiveRecord::Migration
  def up
    create_table :subscriptions do |t|
      t.timestamp :starts_at
      t.timestamp :ends_at
      t.references :plan, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end

    change_table :users do |t|
      t.remove :plan_id
    end
  end

  def down
    change_table :users do |t|
      t.references :plan, index: true, foreign_key: true
    end

    drop_table :subscriptions
  end
end
