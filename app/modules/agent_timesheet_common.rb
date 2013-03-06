module AgentTimesheetCommon

  attr_accessor :start_date, :end_date, :campaigns, :agents, :call_centres, :overview, :team_result_sheet,
                :agent_timesheet, :display_hours, :display_results, :display_value, :display_cost, :only_show_results,
                :currency_id

  TIMESHEETS_PATH = "public/system/agent_timesheets_cache"

  DEFAULT_OPTIONS = {
      :show_weekends     => true,
      :only_show_results => true,
      :start_date        => (Date.today-1.year).beginning_of_week,
      :end_date          => Date.today.end_of_week,
      :campaigns         => [],
      :agents            => [],
      :call_centres      => [],
      :display_hours     => true,
      :display_results   => true,
      :display_value     => true,
      :display_cost      => true,
      :overview          => true,
      :team_result_sheet => true,
      :agent_timesheet   => true,
      :current_user      => nil,
      :filename          => nil,
      :currency_id       => Currency.euro.id
  }

  def initialize(options = {})
    DEFAULT_OPTIONS.merge(options.symbolize_keys).each do |k,v|
      if [:show_weekends,:only_show_results,:display_hours,:display_results,:display_value,:display_cost,:overview,:team_result_sheet,:agent_timesheet].include?(k)
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

    @agents.reject!{|a| scoped(:results).for_agent(a).sum(:results).eql?(0) } if @only_show_results

  end

  private

  def scoped(var)
    "AgentTimesheet::#{var.to_s.camelize}".constantize.
        show_weekends(@show_weekends).
        for_campaigns(@campaigns).
        with_date_between(@start_date, @end_date).
        for_agents(@agents)
  end

  def first
    @first ||= stats.order("year, week ASC").first
  end

  def last
    @last  ||= stats.order("year, week ASC").last
  end

  public

  def hours
    @hours ||= scoped(:hours)
  end

  def results
    @results ||= scoped(:results)
  end

  def value
    @value ||= scoped(:value)
  end

  def cost
    @cost ||= scoped(:cost)
  end

  def stats
    @stats ||= scoped(:stats)
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

  def reports
    @reports ||= [:overview,:team_result_sheet,:agent_timesheet].select{|rep| rep if send(rep)}
  end

  def variables
    @variables ||= [:hours,:results,:value,:cost].select{|var| var if send("display_#{var}")}
  end

  def cached_timesheets
    begin
      Dir.new(Rails.root.join("#{TIMESHEETS_PATH}/#{@current_user.id}")).entries.sort.reverse.select{|f| f[/\.html/]} #except(['.','..'])#.map{|filename| filename.split('.').first}
    rescue
      []
    end
  end

  def currency
    @currency ||= Currency.find(currency_id)
  end

end