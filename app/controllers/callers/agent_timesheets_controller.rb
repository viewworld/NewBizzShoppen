class Callers::AgentTimesheetsController < Callers::CallerController
  inherit_resources
  set_tab "financial"
  set_subtab "agent_timesheets"

  before_filter lambda {authorize_role(:call_centre, :admin)}

  def show

  end

  def index
    unless params[:search]
      @search = AgentTimesheet::Search.new(:current_user => current_user)
      render :action => :new
    else
      if true
        ::AgentTimesheet::General.new(params[:search].merge(:current_user => current_user)).delay(:queue => current_user_queue).to_file
        super do |format|
          format.html
        end
      else
        redirect_to callers_agent_timesheet_path(::AgentTimesheet::General.new(params[:search].merge(:current_user => current_user)).to_file(false))
      end
    end
  end

  def destroy
    AgentTimesheet::General.destroy(params[:id], current_user)
    flash[:notice] = t("agent_timesheets.flashes.file_deleted")
    redirect_to :back
  end

end