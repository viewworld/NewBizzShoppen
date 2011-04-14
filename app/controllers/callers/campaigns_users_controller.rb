class Callers::CampaignsUsersController < Callers::CallerController
  inherit_resources
  set_tab "campaigns"

  def update
    @campaign = Campaign.find(params[:campaign_id])
    @campaign.assign(params[:campaign_user_ids])
    redirect_to edit_callers_campaign_path(@campaign)
  end

  protected

  def collection
    @campaign = Campaign.find(params[:campaign_id])
    @call_centres = User::CallCentre.all
  end

end