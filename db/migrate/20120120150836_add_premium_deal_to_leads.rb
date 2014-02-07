class AddPremiumDealToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :premium_deal, :boolean, :default => false
    add_column :subscriptions, :premium_deals, :boolean, :default => false
    add_column :subscription_plans, :premium_deals, :boolean, :default => false
  end

  def self.down
    remove_column :leads, :premium_deal
    remove_column :subscriptions, :premium_deals
    remove_column :subscription_plans, :premium_deals
  end
end
