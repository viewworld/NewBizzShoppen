class AddDefaultPriceToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :default_price, :decimal, :precision => 10, :scale => 2, :default => 0

    ActiveRecord::Migration.execute "UPDATE categories SET default_price = 0.0 WHERE default_price IS NULL"
  end

  def self.down
    remove_column :categories, :default_price
  end
end
