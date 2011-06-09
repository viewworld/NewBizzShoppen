class AddCustomerCompanyNameToInvoices < ActiveRecord::Migration
  def self.up
    add_column :invoices, :customer_company_name, :string
  end

  def self.down
    remove_column :invoices, :customer_company_name
  end
end
