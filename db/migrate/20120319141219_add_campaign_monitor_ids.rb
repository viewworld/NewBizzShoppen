class AddCampaignMonitorIds < ActiveRecord::Migration
  def self.up
    add_column :users, :cm_client_id, :string
    add_column :newsletter_lists, :cm_list_id, :string
  end

  def self.down
    remove_column :users, :cm_client_id
    remove_column :newsletter_lists, :cm_list_id
  end
end
