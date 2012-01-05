class AgentTimesheet::Search

  attr_accessor :start_date, :end_date

  include AgentTimesheetCommon
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  def persisted?
    false
  end

end