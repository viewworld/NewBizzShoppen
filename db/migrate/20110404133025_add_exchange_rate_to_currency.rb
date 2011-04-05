class AddExchangeRateToCurrency < ActiveRecord::Migration
  def self.up
    add_column :currencies, :exchange_rate, :decimal
  end

  def self.down
    remove_column :currencies, :exchange_rate
  end
end
