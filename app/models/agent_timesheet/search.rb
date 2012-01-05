class AgentTimesheet::Search

  attr_accessor :start_date, :end_date, :show_weekends, :campaigns, :display_time, :display_results, :display_value, :overview, :team_result_sheet, :agent_timesheet

  include AgentTimesheetCommon
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  def persisted?
    false
  end

end