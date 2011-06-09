class AddLeadNotificationTypeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :lead_notification_type, :integer, :default => "0"
    ActiveRecord::Migration.execute "UPDATE users SET lead_notification_type = 0 WHERE lead_notification_type IS NULL"
  end

  def self.down
    remove_column :users, :lead_notification_type
  end
end
