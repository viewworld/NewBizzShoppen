module AgentTimesheet

  attr_accessor :first_week, :last_week

  DEFAULT_OPTIONS = {
      :show_weekends    => true,
      :start_date       => Date.today.beginning_of_week,
      :end_date         => Date.today.end_of_week,
      :campaigns        => [],
      :agents           => [],
      :call_centres     => [],
      :display_time     => true,
      :display_results  => true,
      :display_value    => true,
      :overview         => true,
      :team_results     => true,
      :agent_timesheet  => true
  }

  def initialize(options = {})
    DEFAULT_OPTIONS.merge(options).each do |k,v|
      instance_variable_set("@#{k}".to_sym, v)
    end
  end

  def first_week
    @first_week ||= scoped_view.minimum(:week)
  end

  def last_week
    @last_week ||= scoped_view.maximum(:week)
  end

end