class Callers::MaterialsController < Callers::CallerController
  inherit_resources
  set_tab "campaigns"
  layout 'campaign_materials'

  before_filter :fetch_campaign
  before_filter lambda {authorize_manage_rights(@campaign)}

  private

  def fetch_campaign
    @campaign = Campaign.available_for_user(current_user).find(params[:campaign_id])
  end

  public

  def index
    @materials = @campaign.materials
    @material = @campaign.materials.new(params[:material])
  end

  def create
    @material = @campaign.materials.build(params[:material])
  end

  def destroy
  end
end