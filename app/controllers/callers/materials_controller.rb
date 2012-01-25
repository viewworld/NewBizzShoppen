class Callers::MaterialsController < Callers::CallerController
  inherit_resources
  set_tab "campaigns"
  include ::MaterialActions
  layout proc{ |c| c.request.xhr? ? "send_material" : "faircalls/application" }

  before_filter :set_resource
  before_filter lambda {authorize_access_rights(@campaign)}

  protected

  def set_resource
    @campaign = Campaign.available_for_user(current_user).find(params[:campaign_id])
    @resource = @campaign
  end
end