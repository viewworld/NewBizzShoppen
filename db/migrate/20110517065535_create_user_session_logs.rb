class CreateUserSessionLogs < ActiveRecord::Migration
  def self.up
    create_table :user_session_logs do |t|
      t.integer :user_id
      t.datetime :start_time
      t.datetime :end_time
      t.integer :log_type
      t.timestamps
    end
  end

  def self.down
    drop_table :user_session_logs
  end
end
