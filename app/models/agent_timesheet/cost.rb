class AgentTimesheet::Cost < ActiveRecord::Base
  self.table_name =  'agent_timesheets_cost'

  include AgentTimesheet::TimesheetBase
end
