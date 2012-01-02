class AddPaypalRetriesCounterToSubscription < ActiveRecord::Migration
  def self.up
    add_column :subscriptions, :paypal_retries_counter, :integer, :default => 0
    ActiveRecord::Migration.execute "UPDATE subscriptions SET paypal_retries_counter = 0 WHERE paypal_retries_counter is NULL"
  end

  def self.down
    remove_column :subscriptions, :paypal_retries_counter
  end
end
