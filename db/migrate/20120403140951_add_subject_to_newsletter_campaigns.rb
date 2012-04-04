class AddSubjectToNewsletterCampaigns < ActiveRecord::Migration
  def self.up
    add_column :newsletter_campaigns, :subject, :string
    add_column :newsletter_campaigns, :cm_campaign_id, :string
  end

  def self.down
    remove_column :newsletter_campaigns, :subject
    remove_column :newsletter_campaigns, :cm_campaign_id
  end
end
