class Callers::CallLogsController < Callers::CallerController

  def create
    @call_log = CallLog.create(params[:call_log])
    render :nothing => true
  end

  def index
    @campaign = Campaign.find(params[:campaign_id])
    @call_logs = @campaign.call_logs
  end

end