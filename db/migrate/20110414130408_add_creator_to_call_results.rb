class AddCreatorToCallResults < ActiveRecord::Migration
  def self.up
    add_column :call_results, :creator_id, :integer, :null => false
    add_column :call_results, :creator_type, :string, :null => false
    remove_column :call_results, :agent_id
  end

  def self.down
    remove_column :call_results, :creator_id
    remove_column :call_results, :creator_type
    add_column :call_results, :agent_id
  end
end
