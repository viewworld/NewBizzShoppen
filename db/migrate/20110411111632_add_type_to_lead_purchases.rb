class AddTypeToLeadPurchases < ActiveRecord::Migration
  def self.up
    add_column :lead_purchases, :type, :string
    execute "UPDATE lead_requests SET type = 'LeadRequest' WHERE requested_by IS NOT NULL"
    execute "UPDATE lead_requests SET type = ''"
  end

  def self.down
    remove_column :lead_purchases, :type
  end
end
