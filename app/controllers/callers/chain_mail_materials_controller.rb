class Callers::ChainMailMaterialsController < Callers::CallerController
  inherit_resources
  set_tab "content"
  set_subtab "chain_mail"

  include ::Controllers::MaterialActions
  layout proc{ |c| c.request.xhr? ? "send_material" : "fairleads/application" }

  before_filter :set_resource

  protected

  def set_resource
    @chain_mail_type = ChainMailType.find(params[:chain_mail_type_id])
    @resource = @chain_mail_type
    params[:material] = params[:asset_chain_mail_material]
  end
end