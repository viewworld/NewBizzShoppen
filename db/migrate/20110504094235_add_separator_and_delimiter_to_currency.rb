class AddSeparatorAndDelimiterToCurrency < ActiveRecord::Migration
  def self.up
    add_column :currencies, :separator, :string, :default => ".", :limit => 1
    add_column :currencies, :delimiter, :string, :default => ",", :limit => 1
  end

  def self.down
    remove_column :currencies, :separator
    remove_column :currencies, :delimiter
  end
end
