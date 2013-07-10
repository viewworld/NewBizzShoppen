class AddTimeZoneToUserSessionLog < ActiveRecord::Migration
  def self.up
    add_column :user_session_logs, :time_zone, :string, :default => "UTC"
#    UserSessionLog.all.each{|usl| usl.user ? usl.update_attribute(:time_zone, usl.user.time_zone) : usl.update_attribute(:time_zone, "UTC")}
  end

  def self.down
    remove_column :user_session_logs, :time_zone
  end
end
