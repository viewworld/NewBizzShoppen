class AddBigBuyerToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :big_buyer, :boolean
  end

  def self.down
    remove_column :users, :big_buyer
  end
end
