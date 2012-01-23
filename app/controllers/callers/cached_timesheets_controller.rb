class Callers::CachedTimesheetsController < Callers::CallerController
  set_tab "financial"
  set_subtab "agent_timesheets"

  before_filter lambda {authorize_role(:call_centre, :admin)}

  def index
    @cached_timesheets = AgentTimesheet::Search.new(:current_user => current_user).cached_timesheets.paginate(:page => params[:page], :per_page => 20)
  end

end