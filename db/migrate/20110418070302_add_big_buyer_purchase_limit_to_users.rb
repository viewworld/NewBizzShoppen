class AddBigBuyerPurchaseLimitToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :big_buyer_purchase_limit, :decimal, :default => 0.0
  end

  def self.down
    remove_column :users, :big_buyer_purchase_limit
  end
end
