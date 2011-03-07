class RemoveNameFromSeller < ActiveRecord::Migration
  def self.up
    remove_column :sellers, :name
  end

  def self.down
    add_column :sellers, :name, :string
  end
end
