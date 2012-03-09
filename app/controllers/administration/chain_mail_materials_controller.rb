class Administration::ChainMailMaterialsController < Administration::AdministrationController
  inherit_resources
  set_tab "content"
  set_subtab "chain_mail"

  include ::MaterialActions
  layout proc{ |c| c.request.xhr? ? "send_material" : "fairleads/application" }

  before_filter :set_resource

  protected

  def set_resource
    @chain_mail = ChainMail.find(params[:chain_mail_id])
    @resource = @chain_mail
    params[:material] = params[:asset_chain_mail_material]
  end
end