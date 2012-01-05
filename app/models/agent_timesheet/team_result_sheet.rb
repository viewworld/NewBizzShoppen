class AgentTimesheet::TeamResultSheet

  include AgentTimesheetCommon

  def results
    @scoped.select("SUM(hours) as hours, SUM(results) as results, SUM(value) as value, week, dow, year, user_id").group("user_id, week, dow, year").group_by_multiple([:year, :week, :user_id, :dow])
  end

end