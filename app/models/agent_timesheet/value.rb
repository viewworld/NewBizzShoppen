class AgentTimesheet::Value < ActiveRecord::Base

  set_table_name 'agent_timesheets_value'

  include AgentTimesheet::TimesheetBase

end