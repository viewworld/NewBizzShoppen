class AddVatNumberToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :vat_number, :string
    add_column :users, :not_charge_vat, :boolean, :default => false
  end

  def self.down
    remove_column :users, :vat_number
    remove_column :users, :not_charge_vat
  end
end
