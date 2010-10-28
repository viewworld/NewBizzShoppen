class AddStateToLeadPurchase < ActiveRecord::Migration
  def self.up
    add_column :lead_purchases, :state, :integer, :default => 0
  end

  def self.down
    remove_column :lead_purchases, :state
  end
end
