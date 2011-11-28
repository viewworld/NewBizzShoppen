class AddRefundIdToSubscriptionSubPeriods < ActiveRecord::Migration
  def self.up
    add_column :subscription_sub_periods, :refund_id, :integer
  end

  def self.down
    remove_column :subscription_sub_periods, :refund_id
  end
end
