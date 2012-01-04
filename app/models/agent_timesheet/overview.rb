class AgentTimesheet::Overview

  include AgentTimesheetCommon

  def results
    @scoped.select("SUM(hours) as hours, SUM(results) as results, SUM(value) as value, week, dow, year").group("week, dow, year").group_by_multiple([:year, :week, :dow])
  end

end