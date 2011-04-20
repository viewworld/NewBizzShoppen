class CreateCampaignsUsers < ActiveRecord::Migration
  def self.up
    create_table :campaigns_users, :id => false do |t|
      t.integer :campaign_id
      t.integer :user_id
    end
  end

  def self.down
    drop_table :campaigns_users
  end
end