class AddLeadNotificationTypeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :lead_notification_type, :integer, :default => "0"
  end

  def self.down
    remove_column :users, :lead_notification_type
  end
end
