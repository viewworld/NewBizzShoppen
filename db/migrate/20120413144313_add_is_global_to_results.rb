class AddIsGlobalToResults < ActiveRecord::Migration
  def self.up
    add_column :results, :is_global, :boolean, :default => true
  end

  def self.down
    remove_column :results, :is_global
  end
end
