class AddAgentLeadStatsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :leads_created_counter, :integer, :default => 0
    add_column :users, :leads_volume_sold_counter, :integer, :default => 0
    add_column :users, :leads_revenue_counter, :float, :default => 0.0
    add_column :users, :leads_purchased_month_ago_counter, :integer, :default => 0
    add_column :users, :leads_purchased_year_ago_counter, :integer, :default => 0
    add_column :users, :leads_rated_good_counter, :integer, :default => 0
    add_column :users, :leads_rated_bad_counter, :integer, :default => 0
    add_column :users, :leads_not_rated_counter, :integer, :default => 0
    add_column :users, :leads_rating_avg, :integer, :default => 0
    add_column :users, :certification_level, :integer, :default => 0
 end

  def self.down
    remove_column :users, :leads_created_counter
    remove_column :users, :leads_volume_sold_counter
    remove_column :users, :leads_revenue_counter
    remove_column :users, :leads_purchased_month_ago_counter
    remove_column :users, :leads_purchased_year_ago_counter
    remove_column :users, :leads_rated_good_counter
    remove_column :users, :leads_rated_bad_counter
    remove_column :users, :leads_not_rated_counter
    remove_column :users, :leads_rating_avg
    remove_column :users, :certification
  end
end
