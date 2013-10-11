class AddOwnerToSurveys < ActiveRecord::Migration
  def self.up
    add_column :surveys, :owner_id, :integer
    
    Survey.update_all("owner_id = creator_id")

    add_index :surveys, :owner_id
  end

  def self.down
    remove_index :surveys, :owner_id
    remove_column :surveys, :owner_id
  end
end
