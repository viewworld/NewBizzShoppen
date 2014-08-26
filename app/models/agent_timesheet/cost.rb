class AgentTimesheet::Cost < ActiveRecord::Base
  set_table_name 'agent_timesheets_cost'

  include AgentTimesheet::TimesheetBase
end
