class Callers::CallLogsController < Callers::CallerController

  before_filter lambda {authorize_role(:call_centre, :admin)}, :except => [:create]

  def create
    @call_log = CallLog.create(params[:call_log])
    render :nothing => true
  end

  def index
    @campaign = Campaign.find(params[:campaign_id])
    @call_logs = @campaign.call_logs.finished.order("created_at DESC").paginate(:page => params[:page], :per_page => 30, :show_all => params[:show_all])
  end

end