class AgentTimesheet::Hours < ActiveRecord::Base
  self.table_name =  'agent_timesheets_hours'

  include AgentTimesheet::TimesheetBase
end
