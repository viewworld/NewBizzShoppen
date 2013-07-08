class AddDeletedAtToUserSessionLogs < ActiveRecord::Migration
  def self.up
    add_column :user_session_logs, :deleted_at, :datetime, :default => nil
  end

  def self.down
    remove_column :user_session_logs, :deleted_at
  end
end
