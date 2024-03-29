class Callers::AgentTimesheetsController < Callers::CallerController
  inherit_resources
  set_tab "reports"
  set_subtab "agent_timesheets"

  before_filter lambda {authorize_role(:call_centre, :admin, :agent, :call_centre_agent)}

  def show
    respond_to do |wants|
      wants.html
      wants.pdf { send_file AgentTimesheet::General.load_pdf(params[:id], current_user) }
    end
  end

  def index
  end

  def destroy
    AgentTimesheet::General.destroy(params[:id], current_user)
    flash[:notice] = t("agent_timesheets.flashes.file_deleted")
    redirect_to :back
  end

  def create
    if Rails.env.development? or current_user.agent?
      redirect_to callers_agent_timesheet_path(::AgentTimesheet::General.new(params[:search].merge(:current_user => current_user)).to_file)
    else
      ::AgentTimesheet::General.new(params[:search].merge(:current_user => current_user)).delay(:queue => current_user_queue).to_file
      flash[:notice] = t("agent_timesheets.index.timesheet_queued")
      redirect_to callers_agent_timesheets_path
    end
  end

  def new
    @search = AgentTimesheet::Search.new(:current_user => current_user)
  end

end