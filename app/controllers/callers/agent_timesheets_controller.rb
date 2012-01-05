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
    @overview = AgentTimesheet::Overview.new(:campaigns => Campaign.all.map(&:id), :agents => User::Agent.all)
    @team_result_sheet = AgentTimesheet::TeamResultSheet.new(:campaigns => Campaign.all.map(&:id), :agents => User::Agent.all)
  end

end