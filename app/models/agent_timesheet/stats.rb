class AgentTimesheet::Stats < ActiveRecord::Base
  set_table_name 'agent_timesheets_stats'

  include AgentTimesheet::TimesheetBase
end
