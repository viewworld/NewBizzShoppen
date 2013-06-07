class CreateLoginTimeRequests < ActiveRecord::Migration
  def self.up
    create_table :login_time_requests do |t|
      t.string :aasm_state
      t.datetime :start_time
      t.datetime :end_time
      t.integer :user_id
      t.integer :campaign_id
      t.integer :creator_id
      t.integer :approver_id
      t.integer :user_session_log_id
      t.timestamps
    end
  end

  def self.down
    drop_table :login_time_requests
  end
end
