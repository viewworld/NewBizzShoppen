class Callers::AgentPerformancesController < Callers::CallerController

  set_tab "financial"
  set_subtab "agent_performance"

  def show
    @search = AgentPerformance::Search.new(params[:search].merge(:current_user => current_user))
    @search.to_file
  end

end
