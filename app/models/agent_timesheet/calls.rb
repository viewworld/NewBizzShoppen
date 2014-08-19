class AgentTimesheet::Calls < ActiveRecord::Base
  self.table_name =  'agent_timesheets_calls'

  include AgentTimesheet::TimesheetBase
end
