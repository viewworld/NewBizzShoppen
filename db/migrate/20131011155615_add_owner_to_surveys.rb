class AddOwnerToSurveys < ActiveRecord::Migration
  def self.up
    add_column :surveys, :owner_id, :integer
    add_index :surveys, :owner_id
  end

  def self.down
    remove_index :surveys, :owner_id
    remove_column :surveys, :owner_id
  end
end
