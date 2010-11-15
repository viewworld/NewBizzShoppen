class AddPurchasesCounterCacheToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :lead_purchases_count, :integer, :default => 0
  end

  def self.down
    remove_column :leads, :lead_purchases_count
  end
end
