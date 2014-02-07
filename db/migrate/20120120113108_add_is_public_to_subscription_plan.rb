class AddIsPublicToSubscriptionPlan < ActiveRecord::Migration
  def self.up
    add_column :subscription_plans, :is_public, :boolean, :default => true
  end

  def self.down
    remove_column :subscription_plans, :is_public
  end
end
