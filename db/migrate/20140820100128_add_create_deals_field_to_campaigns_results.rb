class AddCreateDealsFieldToCampaignsResults < ActiveRecord::Migration
  def self.up
    add_column :campaigns_results, :create_deals, :boolean, :default => false
  end

  def self.down
    remove_column :campaigns_results, :create_deals
  end
end
