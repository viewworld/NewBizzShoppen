module AgentTimesheetCommon

  attr_accessor :scoped, :agents, :overview, :team_result_sheet, :agent_timesheet

  DEFAULT_OPTIONS = {
      :show_weekends     => true,
      :start_date        => (Date.today-1.year).beginning_of_week,
      :end_date          => Date.today.end_of_week,
      :campaigns         => [],
      :agents            => [],
      :call_centres      => [],
      :display_time      => true,
      :display_results   => true,
      :display_value     => true,
      :overview          => true,
      :team_result_sheet => true,
      :agent_timesheet   => true
  }

  def initialize(options = {})
    DEFAULT_OPTIONS.merge(options.symbolize_keys).each do |k,v|
      if [:display_time,:display_results,:display_value,:overview,:team_result_sheet,:agent_timesheet].include?(k)
        instance_variable_set("@#{k}".to_sym, ActiveRecord::ConnectionAdapters::Column.value_to_boolean(v))
      elsif k == :agents
        instance_variable_set("@#{k}".to_sym, User.find(v))
      elsif k == :campaigns
        instance_variable_set("@#{k}".to_sym, Campaign.find(v))
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
    @last  ||= @scoped.order("year, week DESC").first
  end

  def cweeks
    @weeks ||= @first ? (CWeek.new(@first.week, @first.year)..CWeek.new(@last.week, @last.year)).map : []
  end

  def days_of_week
    @show_weekends ? 0..6 : 0..4
  end

end