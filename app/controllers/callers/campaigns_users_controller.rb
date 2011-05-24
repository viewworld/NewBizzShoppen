class Callers::CampaignsUsersController < Callers::CallerController
  inherit_resources
  set_tab "campaigns"

  def update
    @campaign = Campaign.find(params[:campaign_id])
    authorize_manage_rights(@campaign)
    @campaign.assign(params[:campaign_user_ids])
    redirect_to edit_callers_campaign_path(@campaign)
  end

  protected

  def collection
    @campaign = Campaign.find(params[:campaign_id])
    @call_centres = current_user.has_role?(:admin) ? User::CallCentre.without_locked + User::Agent.without_locked : [current_user]
  end

end