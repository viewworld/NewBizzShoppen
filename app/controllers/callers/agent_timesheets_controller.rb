class Callers::AgentTimesheetsController < Callers::CallerController
  inherit_resources
  set_tab "financial"
  set_subtab "agent_timesheets"

  before_filter lambda {authorize_role(:call_centre, :admin, :call_centre_agent, :agent)}

  def index
    super do |format|
      format.html
    end
  end

  def collection
    @agent_timesheets = AgentTimesheet::Overview.new(:campaigns => Campaign.all.map(&:id), :agents => User::Agent.all.map(&:id))
  end

end