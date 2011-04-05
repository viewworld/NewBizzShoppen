class AddEuroPriceToLeadPurchases < ActiveRecord::Migration
  def self.up
    add_column :lead_purchases, :euro_price, :decimal
  end

  def self.down
    remove_column :lead_purchases, :euro_price
  end
end
