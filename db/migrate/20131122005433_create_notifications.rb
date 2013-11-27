class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text :message
      t.string :title
      t.integer :user_id

      t.datetime :dismissed_at
      t.timestamps
    end
    add_index :notifications, :user_id
  end
end
