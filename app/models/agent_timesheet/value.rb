class AgentTimesheet::Value < ActiveRecord::Base
  self.table_name =  'agent_timesheets_value'

  include AgentTimesheet::TimesheetBase
end
