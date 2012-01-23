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
      :agent_timesheet   => true,
      :current_user      => nil,
      :filename          => nil
  }

  def initialize(options = {})
    DEFAULT_OPTIONS.merge(options.symbolize_keys).each do |k,v|
      if [:show_weekends,:display_hours,:display_results,:display_value,:overview,:team_result_sheet,:agent_timesheet].include?(k)
        instance_variable_set("@#{k}".to_sym, ActiveRecord::ConnectionAdapters::Column.value_to_boolean(v))
      elsif k == :agents
        instance_variable_set("@#{k}".to_sym, User.find_all_by_id(v))
      elsif k == :call_centres
        instance_variable_set("@#{k}".to_sym, User.find_all_by_id(v).map{ |u| [u] + u.subaccounts }.flatten)
      elsif k == :campaigns
        instance_variable_set("@#{k}".to_sym, Campaign.find_all_by_id(v))
      elsif [:start_date,:end_date].include?(k) and v.is_a?(String)
        instance_variable_set("@#{k}".to_sym, Date.parse(v))
      else
        instance_variable_set("@#{k}".to_sym, v)
      end
    end
    @agents = (@agents + @call_centres).uniq

    if @agents.empty?
      @agents = User.find_all_by_id((UserSessionLog.for_campaigns(@campaigns).select("DISTINCT(user_id)").map(&:user_id) + CampaignsUser.for_campaigns(@campaigns).select("DISTINCT(user_id)").map(&:user_id)).uniq)
    elsif @campaigns.empty?
      @campaigns = Campaign.find_all_by_id((UserSessionLog.for_users(@agents).select("DISTINCT(campaign_id)").map(&:campaign_id) + CampaignsUser.for_users(@agents).select("DISTINCT(campaign_id)").map(&:campaign_id)).uniq)
    end

  end

  def scoped
    @scoped ||= AgentTimesheet.
        show_weekends(@show_weekends).
        for_campaigns(@campaigns).
        with_date_between(@start_date, @end_date).
        for_agents(@agents)
  end

  def first
    @first ||= scoped.order("year, week ASC").first
  end

  def last
    @last  ||= scoped.order("year, week ASC").last
  end

  def cweeks
    @weeks ||= first ? (CWeek.new(first.week, first.year)..CWeek.new(last.week, last.year)).map : []
  end

  def days_of_week
    @days_of_week ||= @show_weekends ? 0..6 : 0..4
  end

  def commercial_days_of_week
    days = days_of_week.to_a
    @commercial_days_of_week ||= @show_weekends ? (days << days.shift) : (1..5).to_a
  end

  def cached_timesheets
    begin
      Dir.new(Rails.root.join("public/system/agent_timesheets_cache/#{@current_user.id}")).entries.sort.reverse.except(['.','..']).map{|filename| filename.split('.').first}
    rescue
      []
    end
  end

end