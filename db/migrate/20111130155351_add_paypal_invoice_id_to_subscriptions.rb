class AddPaypalInvoiceIdToSubscriptions < ActiveRecord::Migration
  def self.up
    add_column :subscriptions, :paypal_invoice_id, :integer
  end

  def self.down
    remove_column :subscriptions, :paypal_invoice_id
  end
end
