class AddHideLeadPricesToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :hide_lead_prices, :boolean, :default => false
  end

  def self.down
    remove_column :users, :hide_lead_prices
  end
end
