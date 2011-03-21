class RenameVatPaidInCustomerCountry < ActiveRecord::Migration
  def self.up
    rename_column :invoices, :vat_paid_in_customer_country, :charge_vat
  end

  def self.down
    rename_column :invoice, :charge_vat, :vat_paid_in_customer_country
  end
end
