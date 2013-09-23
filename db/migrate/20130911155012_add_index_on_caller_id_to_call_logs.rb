class AddIndexOnCallerIdToCallLogs < ActiveRecord::Migration
  def self.up
    add_index :call_logs, :caller_id
  end

  def self.down
    remove_index :call_logs, :caller_id
  end
end
