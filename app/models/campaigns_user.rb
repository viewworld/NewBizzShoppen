class CampaignsUser < ActiveRecord::Base

  scope :for_campaigns, lambda{|c| where(:campaign_id => c.to_a)}
  scope :for_users, lambda{|u| where(:user_id => u.to_a)}

end