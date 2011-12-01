class AddTypeToPaymentNotification < ActiveRecord::Migration
  def self.up
    add_column :payment_notifications, :type, :string
    PaymentNotification.update_all("type = 'CartPaymentNotification'")
  end

  def self.down
    remove_column :payment_notifications, :type
  end
end
