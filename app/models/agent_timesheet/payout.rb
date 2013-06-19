class AgentTimesheet::Payout < ActiveRecord::Base

  set_table_name 'agent_timesheets_payouts'

  include AgentTimesheet::TimesheetBase

end