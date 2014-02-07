class AddAutoBuyToCategoryCustomers < ActiveRecord::Migration
  def self.up
    add_column :categories, :auto_buy, :boolean, :default => false
  end

  def self.down
    remove_column :categories, :auto_buy
  end
end
