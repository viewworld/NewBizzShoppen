class AddTypeToLeadPurchases < ActiveRecord::Migration
  def self.up
    add_column :lead_purchases, :type, :string
  end

  def self.down
    remove_column :lead_purchases, :type
  end
end
