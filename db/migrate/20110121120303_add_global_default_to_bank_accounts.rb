class AddGlobalDefaultToBankAccounts < ActiveRecord::Migration
  def self.up
    add_column :bank_accounts, :global_default, :boolean, :default => false
    rename_column :bank_accounts, :default_bank, :country_default
  end

  def self.down
    remove_column :bank_accounts, :global_default
    rename_column :bank_accounts, :country_default, :default_bank
  end
end
