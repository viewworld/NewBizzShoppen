class AddShowInactiveCampaignsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :show_inactive_campaigns, :boolean, :default => false
    User.update_all(:show_inactive_campaigns => false)
  end

  def self.down
    remove_column :users, :show_inactive_campaigns
  end
end
