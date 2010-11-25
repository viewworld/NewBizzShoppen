class AddContactedToLeadPurchase < ActiveRecord::Migration
  def self.up
    add_column :lead_purchases, :contacted, :integer, :default => 0
  end

  def self.down
    remove_column :lead_purchases, :contacted
  end
end
