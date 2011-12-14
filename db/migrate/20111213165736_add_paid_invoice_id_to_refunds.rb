class AddPaidInvoiceIdToRefunds < ActiveRecord::Migration
  def self.up
    add_column :credit_notes, :paid_invoice_id, :integer
  end

  def self.down
    remove_column :credit_notes, :paid_invoice_id
  end
end
