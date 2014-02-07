class AddTimeZoneToUserSessionLog < ActiveRecord::Migration
  def self.up
    add_column :user_session_logs, :time_zone, :string, :default => "UTC"
  end

  def self.down
    remove_column :user_session_logs, :time_zone
  end
end
