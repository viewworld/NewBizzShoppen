class AgentTimesheet::Results < ActiveRecord::Base
  self.table_name =  'agent_timesheets_results'

  include AgentTimesheet::TimesheetBase
end
