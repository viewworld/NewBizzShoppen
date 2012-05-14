class AddPaymentRetryAtToSubscriptionSubPeriods < ActiveRecord::Migration
  def self.up
    add_column :subscription_sub_periods, :payment_retry_at, :date, :default => nil
  end

  def self.down
    remove_column :subscription_sub_periods, :payment_retry_at
  end
end
