class AgentTimesheet::Calls < ActiveRecord::Base

  set_table_name 'agent_timesheets_calls'

  include AgentTimesheet::TimesheetBase

end