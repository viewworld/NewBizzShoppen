class AddBillingPriceToSubscriptionPlans < ActiveRecord::Migration
  def self.up
    add_column :subscription_plans, :billing_price, :decimal, :precision => 10, :scale => 2
    rename_column :subscription_plans, :team_buyer, :team_buyers
    rename_column :subscriptions, :team_buyer, :team_buyers
  end

  def self.down
    remove_column :subscription_plans, :billing_price
  end
end
