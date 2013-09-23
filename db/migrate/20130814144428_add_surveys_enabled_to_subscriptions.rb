class AddSurveysEnabledToSubscriptions < ActiveRecord::Migration
  def self.up
    add_column :subscription_plans, :surveys_enabled, :boolean, :default => false
    add_column :subscriptions, :surveys_enabled, :boolean, :default => false
    add_column :users, :surveys_enabled, :boolean, :default => false
  end

  def self.down
    remove_column :subscription_plans, :surveys_enabled
    remove_column :subscriptions, :surveys_enabled
    remove_column :users, :surveys_enabled
  end
end
