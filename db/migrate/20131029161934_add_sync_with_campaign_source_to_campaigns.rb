class AddSyncWithCampaignSourceToCampaigns < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :sync_with_campaign_source, :boolean, :default => false
  end

  def self.down
    remove_column :campaigns, :sync_with_campaign_source
  end
end
