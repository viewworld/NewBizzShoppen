class AgentTimesheetsPayout < ActiveRecord::Base

  belongs_to :user
  belongs_to :campaign

  scope :for_user, lambda{|u| where(:user_id => u.to_i)}
  scope :for_users, lambda{|u| where(:user_id => u.to_a)}
  scope :for_campaign, lambda{|c| where(:campaign_id => c.to_i)}
  scope :for_campaigns, lambda{|c| where(:campaign_id => c.to_a)}
  scope :created_between, lambda{|start_date, end_date| where("created_at BETWEEN ? and ?", start_date.to_datetime, end_date.to_datetime) }

end