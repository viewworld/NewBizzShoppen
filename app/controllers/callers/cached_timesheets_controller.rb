class Callers::CachedTimesheetsController < Callers::CallerController
  set_tab "reports"
  set_subtab "agent_timesheets"

  before_filter lambda {authorize_role(:call_centre, :admin)}

  def index
    @cached_timesheets = AgentTimesheet::Search.new(:current_user => current_user).cached_timesheets.paginate(:show_all => params[:show_all], :page => params[:page], :per_page => 20)
  end

end