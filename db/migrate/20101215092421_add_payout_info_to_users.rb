class AddPayoutInfoToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :paypal_email, :string
    add_column :users, :bank_swift_number, :string
    add_column :users, :bank_iban_number, :string
    add_column :users, :can_edit_payout_information, :boolean, :default => false
  end

  def self.down
    remove_column :users, :paypal_email
    remove_column :users, :bank_swift_number
    remove_column :users, :bank_iban_number
    remove_column :users, :can_edit_payout_information
  end
end
