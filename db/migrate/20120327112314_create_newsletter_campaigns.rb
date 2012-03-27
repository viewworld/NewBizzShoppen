class CreateNewsletterCampaigns < ActiveRecord::Migration
  def self.up
    create_table :newsletter_campaigns do |t|
      t.string :name
      t.integer :owner_id
      t.integer :creator_id
      t.string :creator_type
      t.boolean :is_archived, :default => false
      t.integer :status, :default => 0

      t.timestamps
    end

    create_table :newsletter_campaigns_newsletter_lists, :id => false do |t|
      t.integer :newsletter_campaigns_id
      t.integer :newsletter_list_id
    end
  end

  def self.down
    drop_table :newsletter_campaigns
    drop_table :newsletter_campaigns_newsletter_lists
  end
end
