class Callers::AgentPerformancesController < Callers::CallerController
  set_tab 'reports'
  set_subtab 'agent_performance'

  def show
    params[:search] ||= {}
    @search = AgentPerformance::Search.new(params[:search].merge(:current_user => current_user))
    @search.to_file
  end

  def summary
    render :partial => 'summary', :layout => false
  end

  def agents
    params[:date_from] ||= Date.today
    params[:date_to] ||= Date.today
    params[:currency_id] ||= Currency.dkk
    @performance_campaigns = AgentPerformance.performance_campaigns(current_user, params[:call_centre])
    @agents = User.select('DISTINCT(users.*)').joins(:user_session_logs).
        where(:user_session_logs => {:campaign_id => @performance_campaigns,
                                     :end_date => params[:date_from]..params[:date_to]})
    render '/shared/call_centre_home/_agent_performance', :layout => false
  end
end
