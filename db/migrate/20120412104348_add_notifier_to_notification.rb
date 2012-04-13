class AddNotifierToNotification < ActiveRecord::Migration
  def self.up
    add_column :notifications, :notifier_type, :string
    add_column :notifications, :notifier_id, :integer
  end

  def self.down
    remove_column :notifications, :notifier_type
    remove_column :notifications, :notifier_id
  end
end
