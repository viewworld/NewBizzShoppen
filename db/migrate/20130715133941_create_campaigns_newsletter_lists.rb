class CreateCampaignsNewsletterLists < ActiveRecord::Migration
  def self.up
    create_table :campaigns_newsletter_lists, :id => false do |t|
      t.integer :campaign_id
      t.integer :newsletter_list_id
    end
  end

  def self.down
    drop_table :campaigns_newsletter_lists
  end
end
