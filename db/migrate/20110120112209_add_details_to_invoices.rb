class AddDetailsToInvoices < ActiveRecord::Migration
  def self.up
    add_column :invoices, :details, :text
  end

  def self.down
    remove_column :invoices, :details
  end
end
