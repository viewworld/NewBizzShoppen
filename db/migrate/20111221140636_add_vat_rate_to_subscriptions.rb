class AddVatRateToSubscriptions < ActiveRecord::Migration
  def self.up
    add_column :subscriptions, :vat_rate, :decimal
    add_column :subscription_plan_lines, :brutto_price, :decimal
  end

  def self.down
    remove_column :subscriptions, :vat_rate
    remove_column :subscription_plan_lines, :brutto_price
  end
end
