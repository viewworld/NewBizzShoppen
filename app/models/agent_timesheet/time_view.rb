class AgentTimesheet::TimeView < ActiveRecord::Base

  set_table_name 'agent_timesheets_time'

  scope :show_weekends, lambda{|show| show ? where({}) : where(:dow => 0..4) }
  scope :for_campaigns, lambda{|campaign| where(:campaign_id => campaign.map(&:to_i))}
  scope :for_agents, lambda{|users| where(:user_id => users.map(&:to_i))}
  scope :for_week, lambda{|week| where(:week => week)}

end