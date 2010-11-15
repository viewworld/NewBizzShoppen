class AddExpirationStatusToLeadPurchases < ActiveRecord::Migration
  def self.up
    add_column :lead_purchases, :expiration_status, :integer, :default => 0
  end

  def self.down
    remove_column :lead_purchases, :expiration_status
  end
end
