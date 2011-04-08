class CallCentres::CampaignsUsersController < CallCentres::CallCentreController
  inherit_resources
  set_tab "campaigns"

  def update
    @campaign = Campaign.find(params[:campaign_id])
    @campaign.assign(params[:campaign_user_ids])
    redirect_to edit_call_centres_campaign_path(@campaign)
  end

  protected

  def collection
    @campaign = Campaign.find(params[:campaign_id])
    @call_centres = User::CallCentre.all
  end

end