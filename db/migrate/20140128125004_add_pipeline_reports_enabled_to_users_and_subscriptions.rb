class AddPipelineReportsEnabledToUsersAndSubscriptions < ActiveRecord::Migration
  def self.up
    add_column :users, :pipeline_reports_enabled, :boolean, :default => false
    add_column :subscription_plans, :pipeline_reports_enabled, :boolean, :default => false
    add_column :subscriptions, :pipeline_reports_enabled, :boolean, :default => false
  end

  def self.down
    remove_column :subscriptions, :pipeline_reports_enabled
    remove_column :subscription_plans, :pipeline_reports_enabled
    remove_column :users, :pipeline_reports_enabled
  end
end
