class AddUnitAndSubunitToCurrencies < ActiveRecord::Migration
  def self.up
    add_column :currencies, :unit_name, :string
    add_column :currencies, :subunit_name, :string
  end

  def self.down
    remove_column :currencies, :unit_name
    remove_column :currencies, :subunit_name
  end
end
