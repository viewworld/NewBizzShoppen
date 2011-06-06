class AddGlobalDefaultToCurrencies < ActiveRecord::Migration
  def self.up
    add_column :currencies, :global_default, :boolean, :default => false
    ActiveRecord::Migration.execute "UPDATE currencies SET global_default = 'f' WHERE global_default IS NULL"
  end

  def self.down
    remove_column :currencies, :global_default
  end
end
