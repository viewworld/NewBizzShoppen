class Callers::AdvancedExportsController < Callers::CallerController
  set_tab "campaigns"
  include ::CampaignActions

  before_filter :set_campaign
  before_filter lambda { authorize_role(:call_centre, :admin) }

  def new
    @advanced_export = AdvancedExport.new(params)
  end

  def create
    set_locals(params[:advanced_export])
    @call_result_ids = CallResult.for_table_row(@date_from, @date_to, @results.map(&:id), @agent_ids, @campaign.is_a?(Array) ? @campaign.map(&:id) : @campaign.id).map{|hash| hash[:ids]}.flatten

    respond_to do |wants|
      wants.xls { send_data render_to_string, :filename => "call_result.xls" }
    end
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

end