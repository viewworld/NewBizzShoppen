class AddAgentIdAndCampaignIdToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :agent_id, :integer
    add_column :leads, :campaign_id, :integer
  end

  def self.down
    remove_column :leads, :campaign_id
    remove_column :leads, :agent_id
  end
end
