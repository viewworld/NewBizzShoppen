class DealMakerMaterialsController < SecuredController
  inherit_resources
  set_tab "deal_maker_users"
  include ::Controllers::MaterialActions

  before_filter :set_resource, :check_role


  protected

  def set_resource
    @resource = current_user
  end

  def check_role
    raise CanCan::AccessDenied unless user_signed_in? and current_user.deal_maker? and current_user.has_any_role?(:call_centre, :call_centre_agent, :agent)
  end
end