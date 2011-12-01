class AddSubscriptionText < ActiveRecord::Migration
  def self.up
    add_column :subscription_plans, :subscription_text, :text
    add_column :subscriptions, :subscription_text, :text
  end

  def self.down
    remove_column :subscription_plans, :subscription_text
    remove_column :subscriptions, :subscription_text
  end
end
