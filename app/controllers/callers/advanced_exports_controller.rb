class Callers::AdvancedExportsController < Callers::CallerController
  set_tab 'campaigns'
  include ::CampaignActions

  before_filter :set_campaign
  before_filter lambda { authorize_role(:call_centre, :admin) }

  def new
    @advanced_export = AdvancedExport.new(params)
  end

  def create
    respond_to do |format|
      format.xlsx { send_data CallersAdvancedExport.new(params, self, @campaign).perform }
    end
  end

  private

  def set_campaign
    @campaign ||= Campaign.find(params[:campaign_id])
  end
end
