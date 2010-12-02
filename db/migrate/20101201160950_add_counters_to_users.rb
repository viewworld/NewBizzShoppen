class AddCountersToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :completed_leads_counter, :integer, :default => 0
    add_column :users, :leads_requested_counter, :integer, :default => 0
    add_column :users, :leads_assigned_month_ago_counter, :integer, :default => 0
    add_column :users, :leads_assigned_year_ago_counter, :integer, :default => 0
    add_column :users, :total_leads_assigned_counter, :integer, :default => 0
  end

  def self.down
    remove_column :users, :completed_leads_counter
    remove_column :users, :leads_requested_counter
    remove_column :users, :leads_assigned_month_ago_counter
    remove_column :users, :leads_assigned_year_ago_counter
    remove_column :users, :total_leads_assigned_counter
  end
end
