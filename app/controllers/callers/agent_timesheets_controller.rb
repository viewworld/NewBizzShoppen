class Callers::AgentTimesheetsController < Callers::CallerController
  inherit_resources
  set_tab "financial"
  set_subtab "agent_timesheets"

  before_filter lambda {authorize_role(:call_centre, :admin, :call_centre_agent, :agent)}

  def index
    unless params[:search]
      @search = AgentTimesheet::Search.new
      render :action => :new
    else
      super do |format|
        format.html
      end
    end
  end

  def collection
    @timesheet = ::AgentTimesheet::General.new(params[:search])
  end

end