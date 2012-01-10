class ::AgentTimesheet::General

  include AgentTimesheetCommon

  def build_select(grp)
    sel = grp.dup
    sel << "SUM(hours) as hours" if @display_hours
    sel << "SUM(results) as results" if @display_results
    sel << "SUM(value) as value" if @display_value
    sel.join(",")
  end

  def overview_data
    grp = [:year, :week , :dow]
    @scoped.select(build_select(grp)).group(grp.join(",")).group_by_multiple(grp)
  end

  def team_result_sheet_data
    grp = [:year, :week, :user_id, :dow]
    @scoped.select(build_select(grp)).group(grp.join(",")).group_by_multiple(grp)
  end

  def agent_time_sheet_data(agent)
    grp = [:first_result, :last_result, :log_out_time, :week, :dow, :year, :user_id]
    @scoped.select(build_select(grp)).group(grp.join(",")).where(:user_id => agent.to_i).group_by_multiple([:year, :week, :dow])
  end

  def colspan
    res = 0
    res += 1 if @display_hours
    res += 1 if @display_results
    res += 1 if @display_value
    res
  end

end