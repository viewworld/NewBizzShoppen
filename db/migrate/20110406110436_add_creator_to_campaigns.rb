class AddCreatorToCampaigns < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :creator_id, :integer, :null => false
    add_column :campaigns, :creator_type, :string, :null => false
  end

  def self.down
    remove_column :campaigns, :creator_id
    remove_column :campaigns, :creator_type
  end
end
