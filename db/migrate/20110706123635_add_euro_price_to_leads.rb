class AddEuroPriceToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :euro_price, :float
  end

  def self.down
    remove_column :leads, :euro_price
  end
end
