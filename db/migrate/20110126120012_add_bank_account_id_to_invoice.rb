class AddBankAccountIdToInvoice < ActiveRecord::Migration
  def self.up
    add_column :invoices, :bank_account_id, :integer
  end

  def self.down
    remove_column :invoices, :bank_account_id
  end
end
