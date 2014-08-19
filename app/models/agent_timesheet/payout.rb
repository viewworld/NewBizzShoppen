class AgentTimesheet::Payout < ActiveRecord::Base
  self.table_name = 'agent_timesheets_payouts'

  include AgentTimesheet::TimesheetBase
end
