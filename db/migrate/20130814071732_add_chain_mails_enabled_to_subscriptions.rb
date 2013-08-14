class AddChainMailsEnabledToSubscriptions < ActiveRecord::Migration
  def self.up
    add_column :subscription_plans, :chain_mails_enabled, :boolean, :default => false
    add_column :subscriptions, :chain_mails_enabled, :boolean, :default => false
    add_column :users, :chain_mails_enabled, :boolean, :default => false
  end

  def self.down
    remove_column :subscription_plans, :chain_mails_enabled
    remove_column :subscriptions, :chain_mails_enabled
    remove_column :users, :chain_mails_enabled
  end
end
