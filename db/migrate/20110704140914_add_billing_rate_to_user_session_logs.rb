class AddBillingRateToUserSessionLogs < ActiveRecord::Migration
  def self.up
    add_column :user_session_logs, :euro_billing_rate, :float
  end

  def self.down
    remove_column :user_session_logs, :euro_billing_rate
  end
end
