class AddIsPublicToSubscriptionPlan < ActiveRecord::Migration
  def self.up
    add_column :subscription_plans, :is_public, :boolean, :default => true

    ActiveRecord::Migration.execute "UPDATE subscription_plans SET is_public = 't' WHERE is_public IS NULL"
  end

  def self.down
    remove_column :subscription_plans, :is_public
  end
end
