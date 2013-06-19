class AgentTimesheet::TimeOnPhone < ActiveRecord::Base

  set_table_name 'agent_timesheets_time_on_phone'

  include AgentTimesheet::TimesheetBase

end