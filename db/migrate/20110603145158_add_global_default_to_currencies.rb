class AddGlobalDefaultToCurrencies < ActiveRecord::Migration
  def self.up
    add_column :currencies, :global_default, :boolean, :default => false
  end

  def self.down
    remove_column :currencies, :global_default
  end
end
