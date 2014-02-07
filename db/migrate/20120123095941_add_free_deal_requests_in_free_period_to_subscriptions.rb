class AddFreeDealRequestsInFreePeriodToSubscriptions < ActiveRecord::Migration
  def self.up
    add_column :subscription_plans, :free_deal_requests_in_free_period, :integer, :default => 0
    add_column :subscriptions, :free_deal_requests_in_free_period, :integer, :default => 0
    add_column :users, :free_deal_requests_in_free_period, :integer, :integer => nil
    add_column :users, :free_deals_in_free_period, :integer, :integer => nil
  end

  def self.down
    remove_column :subscription_plans, :free_deal_requests_in_free_period
    remove_column :subscriptions, :free_deal_requests_in_free_period
    remove_column :users, :free_deal_requests_in_free_period
    remove_column :users, :free_deals_in_free_period
  end
end
