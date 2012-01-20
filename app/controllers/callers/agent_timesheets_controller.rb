class Callers::AgentTimesheetsController < Callers::CallerController
  inherit_resources
  set_tab "financial"
  set_subtab "agent_timesheets"

  before_filter lambda {authorize_role(:call_centre, :admin, :call_centre_agent, :agent)}

  def show

  end

  def index
    unless params[:search]
      @search = AgentTimesheet::Search.new(:current_user => current_user)
      render :action => :new
    else
      if Rails.env.production?
        ::AgentTimesheet::General.new(params[:search].merge(:current_user => current_user)).delay.to_file
        super do |format|
          format.html
        end
      else
        redirect_to callers_agent_timesheet_path(::AgentTimesheet::General.new(params[:search].merge(:current_user => current_user)).to_file(false))
      end
    end
  end

end