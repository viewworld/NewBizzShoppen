class AddDealPriceToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :deal_price, :decimal
  end

  def self.down
    remove_column :leads, :deal_price
  end
end
