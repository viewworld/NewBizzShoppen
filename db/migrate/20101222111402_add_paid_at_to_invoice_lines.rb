class AddPaidAtToInvoiceLines < ActiveRecord::Migration
  def self.up
    add_column :invoice_lines, :paid_at, :datetime
  end

  def self.down
    remove_column :invoice_lines, :paid_at
  end
end
