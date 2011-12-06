class AddPaypalTxnIdToSubscriptionSubPeriods < ActiveRecord::Migration
  def self.up
    add_column :subscription_sub_periods, :paypal_txn_id, :string
  end

  def self.down
    remove_column :subscription_sub_periods, :paypal_txn_id
  end
end
