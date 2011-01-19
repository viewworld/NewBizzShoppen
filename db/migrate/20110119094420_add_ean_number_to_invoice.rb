class AddEanNumberToInvoice < ActiveRecord::Migration
  def self.up
    add_column :invoices, :ean_number, :string
  end

  def self.down
    remove_column :invoices, :ean_number
  end
end
