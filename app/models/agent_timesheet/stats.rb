class AgentTimesheet::Stats < ActiveRecord::Base
  self.table_name =  'agent_timesheets_stats'

  include AgentTimesheet::TimesheetBase
end
