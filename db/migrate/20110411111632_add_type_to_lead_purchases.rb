class AddTypeToLeadPurchases < ActiveRecord::Migration
  def self.up
    add_column :lead_purchases, :type, :string
    execute "UPDATE lead_purchases SET type = 'LeadRequest' WHERE requested_by IS NOT NULL"
    execute "UPDATE lead_purchases SET type = 'LeadSinglePurchase' WHERE requested_by IS NULL and quantity = 1"
    execute "UPDATE lead_purchases SET type = 'LeadBuyout' WHERE requested_by IS NULL and quantity <> 1"
  end

  def self.down
    remove_column :lead_purchases, :type
  end
end
