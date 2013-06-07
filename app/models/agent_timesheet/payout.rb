class AgentTimesheet::Payout < ActiveRecord::Base

  set_table_name 'agent_timesheets_payouts'

  belongs_to :user
  belongs_to :campaign

  scope :show_weekends, lambda{|show| where(:dow => 0..4) unless show }
  scope :with_date_between, lambda{|start_date,end_date| where("created_at BETWEEN ? and ?", start_date, end_date)}
  scope :for_user, lambda{|u| where(:user_id => u.to_i)}
  scope :for_users, lambda{|u| where(:user_id => u.to_a)}
  scope :for_campaign, lambda{|c| where(:campaign_id => c.to_i)}
  scope :for_campaigns, lambda{|c| where(:campaign_id => c.to_a)}
  scope :created_between, lambda{|start_date, end_date| where("created_at BETWEEN ? and ?", start_date.to_datetime, end_date.to_datetime) }
  scope :for_agents, lambda{|users| where(:user_id => Array(users).map(&:to_i))}
  scope :for_agent, lambda{|user| where("user_id = ?", user.to_i)}
  scope :for_cweek, lambda{|cweek| where(:week => cweek.cweek, :year => cweek.year)}
  scope :for_dow, lambda{|dow| where(:dow => dow)}
  scope :for_year, lambda{|year| where(:year => year)}

end