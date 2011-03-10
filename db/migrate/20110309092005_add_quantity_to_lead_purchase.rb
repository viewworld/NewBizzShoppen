class AddQuantityToLeadPurchase < ActiveRecord::Migration
  def self.up
    add_column :lead_purchases, :quantity, :integer, :default => 1, :null => false
  end

  def self.down
    remove_column :lead_purchases, :quantity
  end
end
