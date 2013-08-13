class Callers::AdvancedExportsController < Callers::CallerController
  set_tab "campaigns"

  before_filter :set_campaign
  before_filter lambda { authorize_role(:call_centre, :admin) }

  def new
  end

  def create
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

end