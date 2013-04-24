class ChangeCallLog < ActiveRecord::Migration
  def self.up
    remove_column :call_logs, :call_result_id
    remove_column :call_logs, :duration
    remove_column :call_logs, :start_time
    remove_column :call_logs, :end_time
    add_column :call_logs, :call_id, :string
    add_column :call_logs, :state, :string
    add_column :call_logs, :holded, :boolean
    add_column :call_logs, :callee, :string
    add_column :call_logs, :caller, :string
    add_column :call_logs, :visible_name_callee, :string
    add_column :call_logs, :visible_name_caller, :string
    add_column :call_logs, :player_video_height, :integer
    add_column :call_logs, :player_video_width, :integer
    add_column :call_logs, :streamer_video_height, :integer
    add_column :call_logs, :streamer_video_width, :integer
    add_column :call_logs, :time_of_call, :integer
    add_column :call_logs, :another_side_user, :string
    add_column :call_logs, :incoming, :boolean
    add_column :call_logs, :is_video_call, :boolean
    add_column :call_logs, :sip_state, :string
    add_column :call_logs, :contact_id, :integer
    add_column :call_logs, :campaign_id, :integer
    add_column :call_logs, :caller_id, :integer
    add_column :call_logs, :caller_type, :string
    add_index :call_logs, :call_id
    add_index :call_logs, :campaign_id
    add_index :call_logs, :contact_id
    add_index :call_logs, [:caller_type, :caller_id]
  end

  def self.down
  end
end
