class AddIndexes2 < ActiveRecord::Migration
  def self.up
    add_index :leads, [:type,:campaign_id]
    add_index :user_session_logs, [:log_type,:campaign_id]
    add_index :user_session_logs, [:campaign_id]
  end

  def self.down
    remove_index :leads, [:type,:campaign_id]
    remove_index :user_session_logs, [:log_type,:campaign_id]
    remove_index :user_session_logs, [:campaign_id]
  end
end
