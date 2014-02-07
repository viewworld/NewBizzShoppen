class AddDisableBoughtNotificationToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :disable_bought_notification, :boolean, :default => false
  end

  def self.down
    remove_column :users, :disable_bought_notification
  end
end
