class AddTokenToPaymentNotifications < ActiveRecord::Migration
  def self.up
    add_column :payment_notifications, :token, :string
  end

  def self.down
    remove_column :payment_notifications, :token
  end
end
