class AddCallResultIdToCallLogs < ActiveRecord::Migration
  def self.up
    add_column :call_logs, :call_result_id, :integer
  end

  def self.down
    remove_column :call_logs, :call_result_id
  end
end
