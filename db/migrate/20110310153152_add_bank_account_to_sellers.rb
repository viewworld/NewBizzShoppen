class AddBankAccountToSellers < ActiveRecord::Migration
  def self.up
    add_column :sellers, :bank_account_id, :integer
  end

  def self.down
    remove_column :sellers, :bank_account_id
  end
end
