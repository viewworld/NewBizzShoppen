class AddLeadPurchasesCounterToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :lead_purchases_counter, :integer, :default => 0
  end

  def self.down
    remove_column :leads, :lead_purchases_counter
  end
end
