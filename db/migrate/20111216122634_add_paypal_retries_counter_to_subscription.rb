class AddPaypalRetriesCounterToSubscription < ActiveRecord::Migration
  def self.up
    add_column :subscriptions, :paypal_retries_counter, :integer, :default => 0
  end

  def self.down
    remove_column :subscriptions, :paypal_retries_counter
  end
end
