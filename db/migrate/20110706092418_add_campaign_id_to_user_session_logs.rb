class AddCampaignIdToUserSessionLogs < ActiveRecord::Migration
  def self.up
    add_column :user_session_logs, :campaign_id, :integer
    add_column :user_session_logs, :hours_count, :float
  end

  def self.down
    remove_column :user_session_logs, :campaign_id
    remove_column :user_session_logs, :hours_count
  end
end
