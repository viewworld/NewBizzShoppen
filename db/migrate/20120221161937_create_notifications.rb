class CreateNotifications < ActiveRecord::Migration
  def self.up
    create_table :notifications do |t|
      t.string :notificable_type
      t.integer :notificable_id
      t.datetime :notify_at
      t.datetime :dismissed_at
      t.string :title
      t.text :text
      t.boolean :sticky, :default => true
      t.integer :time
      t.timestamps
    end
    add_index :notifications, [:notificable_type, :notificable_id]
    add_index :notifications, :notify_at
    add_index :notifications, :dismissed_at
  end

  def self.down
    drop_table :notifications
  end
end
