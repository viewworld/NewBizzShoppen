module AgentTimesheetCommon

  attr_accessor :scoped, :start_date, :end_date, :campaigns, :agents, :call_centres, :overview, :team_result_sheet, :agent_timesheet, :display_hours, :display_results, :display_value

  DEFAULT_OPTIONS = {
      :show_weekends     => true,
      :start_date        => (Date.today-1.year).beginning_of_week,
      :end_date          => Date.today.end_of_week,
      :campaigns         => [],
      :agents            => [],
      :call_centres      => [],
      :display_hours     => true,
      :display_results   => true,
      :display_value     => true,
      :overview          => true,
      :team_result_sheet => true,
      :agent_timesheet   => true
  }

  def initialize(options = {})
    DEFAULT_OPTIONS.merge(options.symbolize_keys).each do |k,v|
      if [:show_weekends,:display_hours,:display_results,:display_value,:overview,:team_result_sheet,:agent_timesheet].include?(k)
        instance_variable_set("@#{k}".to_sym, ActiveRecord::ConnectionAdapters::Column.value_to_boolean(v))
      elsif k == :agents
        instance_variable_set("@#{k}".to_sym, User.find(v))
      elsif k == :campaigns
        instance_variable_set("@#{k}".to_sym, Campaign.find(v))
      elsif [:start_date,:end_date].include?(k) and v.is_a?(String)
        instance_variable_set("@#{k}".to_sym, Date.parse(v))
      else
        instance_variable_set("@#{k}".to_sym, v)
      end
    end
    @scoped = AgentTimesheet.
        show_weekends(@show_weekends).
        for_campaigns(@campaigns).
        with_date_between(@start_date, @end_date).
        for_agents(@agents)
    @first ||= @scoped.order("year, week ASC").first
    @last  ||= @scoped.order("year, week ASC").last
  end

  def cweeks
    @weeks ||= @first ? (CWeek.new(@first.week, @first.year)..CWeek.new(@last.week, @last.year)).map : []
  end

  def days_of_week
    @days_of_week ||= @show_weekends ? 0..6 : 0..4
  end

  def commercial_days_of_week
    days = days_of_week.to_a
    @commercial_days_of_week ||= @show_weekends ? (days << days.shift) : (1..5).to_a
  end

end