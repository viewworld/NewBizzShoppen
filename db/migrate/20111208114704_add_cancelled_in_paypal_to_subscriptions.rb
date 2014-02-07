class AddCancelledInPaypalToSubscriptions < ActiveRecord::Migration
  def self.up
    add_column :subscriptions, :cancelled_in_paypal, :boolean, :default => false
  end

  def self.down
    remove_column :subscriptions, :cancelled_in_paypal
  end
end
