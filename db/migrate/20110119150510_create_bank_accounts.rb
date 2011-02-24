class CreateBankAccounts < ActiveRecord::Migration
  def self.up
    create_table :bank_accounts do |t|
      t.integer :country_id
      t.string :bank_name
      t.text :bank_address
      t.string :iban_no
      t.string :local_bank_number
      t.string :swift
      t.text :payment_conditions
      t.boolean :default_bank, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :bank_accounts
  end
end
