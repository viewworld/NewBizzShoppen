class AddPremiumDealToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :premium_deal, :boolean, :default => false
    add_column :subscriptions, :premium_deals, :boolean, :default => false
    add_column :subscription_plans, :premium_deals, :boolean, :default => false

    ActiveRecord::Migration.execute "UPDATE leads SET premium_deal = 'f' WHERE premium_deal IS NULL"
    ActiveRecord::Migration.execute "UPDATE subscription_plans SET premium_deals = 'f' WHERE premium_deals IS NULL"
    ActiveRecord::Migration.execute "UPDATE subscriptions SET premium_deals = 'f' WHERE premium_deals IS NULL"
  end

  def self.down
    remove_column :leads, :premium_deal
    remove_column :subscriptions, :premium_deals
    remove_column :subscription_plans, :premium_deals
  end
end
