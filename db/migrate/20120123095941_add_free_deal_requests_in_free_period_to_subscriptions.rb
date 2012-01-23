class AddFreeDealRequestsInFreePeriodToSubscriptions < ActiveRecord::Migration
  def self.up
    add_column :subscription_plans, :free_deal_requests_in_free_period, :integer, :default => 0
    add_column :subscriptions, :free_deal_requests_in_free_period, :integer, :default => 0
    add_column :users, :free_deal_requests_in_free_period, :integer, :integer => nil
    add_column :users, :free_deals_in_free_period, :integer, :integer => nil

    ActiveRecord::Migration.execute "UPDATE subscription_plans SET free_deal_requests_in_free_period = 0 WHERE free_deal_requests_in_free_period IS NULL"
    ActiveRecord::Migration.execute "UPDATE subscriptions SET free_deal_requests_in_free_period = 0 WHERE free_deal_requests_in_free_period IS NULL"
  end

  def self.down
    remove_column :subscription_plans, :free_deal_requests_in_free_period
    remove_column :subscriptions, :free_deal_requests_in_free_period
    remove_column :users, :free_deal_requests_in_free_period
    remove_column :users, :free_deals_in_free_period
  end
end
