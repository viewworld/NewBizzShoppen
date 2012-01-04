class AgentTimesheet < ActiveRecord::Base

  scope :show_weekends, lambda{|show| where(:dow => 0..4) unless show }
  scope :for_campaigns, lambda{|campaign| where(:campaign_id => campaign.map(&:to_i))}
  scope :for_agents, lambda{|users| where(:user_id => users.map(&:to_i))}
  scope :with_date_between, lambda{|start_date,end_date| where("date BETWEEN ? and ?", start_date, end_date)}
  scope :for_cweek, lambda{|week, year| where(:week => week, :year => year)}
  scope :for_dow, lambda{|dow| where(:dow => dow)}
end