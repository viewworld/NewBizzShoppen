class AddAutoBuyToCategoryCustomers < ActiveRecord::Migration
  def self.up
    add_column :categories, :auto_buy, :boolean, :default => false
    Category.update_all("auto_buy = false")
  end

  def self.down
    remove_column :categories, :auto_buy
  end
end
