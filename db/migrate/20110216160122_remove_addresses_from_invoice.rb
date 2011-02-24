class RemoveAddressesFromInvoice < ActiveRecord::Migration
  def self.up
    remove_column :invoices, :customer_address
    remove_column :invoices, :seller_address
  end

  def self.down
    add_column :invoices, :customer_address, :text
    add_column :invoices, :address, :text
  end
end
