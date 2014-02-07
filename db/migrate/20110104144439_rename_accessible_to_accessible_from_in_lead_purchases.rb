class RenameAccessibleToAccessibleFromInLeadPurchases < ActiveRecord::Migration
  def self.up
    add_column :lead_purchases, :accessible_from, :datetime, :default => nil
    remove_column :lead_purchases, :accessible
  end

  def self.down
    add_column :lead_purchases, :accessible, :boolean
    remove_column :lead_purchases, :accessible_from
  end
end
