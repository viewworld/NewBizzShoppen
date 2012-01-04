class AgentTimesheet::HoursResultsValue

  include AgentTimesheetCommon

  def results
    @scoped.select("SUM(hours) as hours, SUM(results) as results, SUM(value) as value, week, dow, year").group("user_id, week, dow, year").group_by_multiple([:year])
  end

end