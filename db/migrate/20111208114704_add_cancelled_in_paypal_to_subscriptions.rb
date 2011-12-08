class AddCancelledInPaypalToSubscriptions < ActiveRecord::Migration
  def self.up
    add_column :subscriptions, :cancelled_in_paypal, :boolean, :default => false
    ActiveRecord::Migration.execute "UPDATE subscriptions SET cancelled_in_paypal = 'f' WHERE cancelled_in_paypal IS NULL"
  end

  def self.down
    remove_column :subscriptions, :cancelled_in_paypal
  end
end
