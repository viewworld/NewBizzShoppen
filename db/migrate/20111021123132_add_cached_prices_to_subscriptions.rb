class AddCachedPricesToSubscriptions < ActiveRecord::Migration
  def self.up
    add_column :subscriptions, :billing_price, :decimal, :precision => 10, :scale => 2
    add_column :subscriptions, :euro_billing_price, :decimal, :precision => 10, :scale => 2
  end

  def self.down
    remove_column :subscriptions, :billing_price
    remove_column :subscriptions, :euro_billing_price
  end
end
