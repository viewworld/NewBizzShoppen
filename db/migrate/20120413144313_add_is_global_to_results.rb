class AddIsGlobalToResults < ActiveRecord::Migration
  def self.up
    add_column :results, :is_global, :boolean, :default => true
    execute "UPDATE results SET is_global = 't' WHERE is_global IS NULL"
  end

  def self.down
    remove_column :results, :is_global
  end
end
