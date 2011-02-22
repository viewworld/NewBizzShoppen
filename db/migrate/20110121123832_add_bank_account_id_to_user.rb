class AddBankAccountIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :bank_account_id, :integer
  end

  def self.down
    remove_column :users, :bank_account_id
  end
end
