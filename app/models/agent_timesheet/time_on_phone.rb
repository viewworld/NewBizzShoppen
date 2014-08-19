class AgentTimesheet::TimeOnPhone < ActiveRecord::Base
  self.table_name =  'agent_timesheets_time_on_phone'

  include AgentTimesheet::TimesheetBase
end
