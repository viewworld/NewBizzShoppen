class AgentTimesheet::Hours < ActiveRecord::Base
  set_table_name 'agent_timesheets_hours'

  include AgentTimesheet::TimesheetBase
end
