class AddAssignedAtToLeadPurchases < ActiveRecord::Migration
  def self.up
    add_column :lead_purchases, :assigned_at, :datetime, :default => nil
  end

  def self.down
    remove_column :lead_purchases, :assigned_at
  end
end
