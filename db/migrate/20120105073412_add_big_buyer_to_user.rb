class AddBigBuyerToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :big_buyer, :boolean
    ActiveRecord::Migration.execute "UPDATE users SET big_buyer = 'f' WHERE big_buyer IS NULL"
  end

  def self.down
    remove_column :users, :big_buyer
  end
end
