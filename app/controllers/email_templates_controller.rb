class EmailTemplatesController < SecuredController
  inherit_resources

  set_tab "deals"

  before_filter :fetch_objects
  before_filter :authorize_for_controller!
  before_filter :authorize_for_deal_maker!

  include EmailTemplatesActions

  private

  def fetch_objects
    @deal = Deal.find(params[:deal_id])
    @email_template = EmailTemplate.find(params[:id])
  end

  def authorize_for_controller!
    authorize_role(:admin, :agent, :call_centre, :call_centre_agent, :supplier)
    authorize_manage_rights(@deal)
  end

  def authorize_for_deal_maker!
    raise CanCan::AccessDenied unless current_user.deal_maker?
  end

  public

  def update
    update! do |success, failure|
      success.html { redirect_to send("edit_#{current_user.role_to_deal_namespace}_deal_path".to_sym, @deal) }
    end
  end

end