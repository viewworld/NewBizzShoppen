class AddFieldsToSubscriptionPlan < ActiveRecord::Migration
  def self.up
    add_column :subscription_plans, :subscription_period, :integer
    add_column :subscriptions, :subscription_period, :integer

    add_column :subscription_plans, :free_deals_in_free_period, :integer, :default => 0
    add_column :subscriptions, :free_deals_in_free_period, :integer, :default => 0

    add_column :subscription_plans, :use_paypal, :boolean, :default => false
    add_column :subscriptions, :use_paypal, :boolean, :default => false

    add_column :subscriptions, :paypal_retries, :integer
    add_column :subscription_plans, :paypal_retries, :integer

    add_column :subscriptions, :paypal_billing_at_start, :boolean, :default => true
    add_column :subscription_plans, :paypal_billing_at_start, :boolean, :default => true

    add_column :subscription_plans, :automatic_downgrading, :boolean, :default => false
    add_column :subscriptions, :automatic_downgrading, :boolean, :default => false

    add_column :subscription_plans, :automatic_downgrade_subscription_plan_id, :integer, :default => nil
    add_column :subscriptions, :automatic_downgrade_subscription_plan_id, :integer, :default => nil
  end

  def self.down
  end
end
