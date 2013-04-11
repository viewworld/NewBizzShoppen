class Callers::CachedCampaignReportsController < Callers::CallerController
  set_tab "financial"
  set_subtab "campaigns_reports"

  before_filter lambda {authorize_role(:call_centre, :admin)}

  def index
    @cached_campaign_reports = CampaignReport::Search.new(:current_user => current_user).cached_campaign_reports.paginate(:show_all => params[:show_all], :page => params[:page], :per_page => 20)
  end

end