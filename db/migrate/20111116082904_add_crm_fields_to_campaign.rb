class AddCrmFieldsToCampaign < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :crm_option, :integer, :default => 0
    add_column :campaigns, :crm_campaigns, :string, :default => ""
    Campaign.update_all("crm_option = 0")
    Campaign.update_all("crm_campaigns = ''")
  end

  def self.down
    remove_column :campaigns, :crm_campaigns
    remove_column :campaigns, :crm_option
  end
end
