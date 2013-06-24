class AddDebugToUserSessionLogs < ActiveRecord::Migration
  def self.up
    add_column :user_session_logs, :debug, :text
  end

  def self.down
  end
end
