class AgentTimesheet::Results < ActiveRecord::Base

  set_table_name 'agent_timesheets_results'

  include AgentTimesheet::TimesheetBase

end