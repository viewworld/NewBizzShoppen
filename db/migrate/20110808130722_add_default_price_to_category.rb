class AddDefaultPriceToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :default_price, :decimal, :precision => 10, :scale => 2, :default => 0
  end

  def self.down
    remove_column :categories, :default_price
  end
end
