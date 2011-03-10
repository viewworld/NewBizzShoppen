class AddPurchasedByToLeadPurchases < ActiveRecord::Migration
  def self.up
    add_column :lead_purchases, :purchased_by, :integer
  end

  def self.down
    remove_column :lead_purchases, :purchased_by
  end
end
