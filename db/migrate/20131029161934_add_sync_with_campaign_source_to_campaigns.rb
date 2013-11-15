class AddSyncWithCampaignSourceToCampaigns < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :sync_with_campaign_source, :boolean, :default => false
    execute "UPDATE campaigns SET sync_with_campaign_source = 'f' WHERE sync_with_campaign_source IS NULL"
  end

  def self.down
    remove_column :campaigns, :sync_with_campaign_source
  end
end
