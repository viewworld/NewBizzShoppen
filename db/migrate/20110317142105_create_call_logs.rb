class CreateCallLogs < ActiveRecord::Migration
  def self.up
    create_table :call_logs do |t|
      t.datetime :start_time, :default => DateTime.now
      t.datetime :end_time
      t.integer  :duration, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :call_logs
  end
end
