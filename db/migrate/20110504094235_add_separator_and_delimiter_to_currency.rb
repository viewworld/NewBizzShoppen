class AddSeparatorAndDelimiterToCurrency < ActiveRecord::Migration
  def self.up
    add_column :currencies, :separator, :string, :default => ".", :limit => 1
    add_column :currencies, :delimiter, :string, :default => ",", :limit => 1
    execute "UPDATE currencies SET separator = '.' WHERE separator IS NULL"
    execute "UPDATE currencies SET delimiter = ',' WHERE delimiter IS NULL"
  end

  def self.down
    remove_column :currencies, :separator
    remove_column :currencies, :delimiter
  end
end
