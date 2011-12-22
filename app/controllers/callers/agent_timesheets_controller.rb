class Callers::AgentTimesheetsController < Callers::CallerController
  inherit_resources
  set_tab "financial"
  set_subtab "agent_timesheets"

  before_filter lambda {authorize_role(:call_centre, :admin, :call_centre_agent, :agent)}

  def index
    super do |format|
      format.html
      #format.pdf { send_file CampaignReport.store_pdf(params[:report]), :type => 'application/pdf'}
    end
  end

  def collection

  end

end