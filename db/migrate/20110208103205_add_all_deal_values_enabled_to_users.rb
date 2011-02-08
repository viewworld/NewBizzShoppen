class AddAllDealValuesEnabledToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :all_deal_values_enabled, :boolean, :default => false
  end

  def self.down
    remove_column :users, :all_deal_values_enabled
  end
end
