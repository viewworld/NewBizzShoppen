class Callers::EmailTemplatesController < Callers::CallerController
  inherit_resources

  set_tab "campaigns"

  before_filter :fetch_objects
  before_filter :authorize_for_controller!

  include ::Controllers::EmailTemplatesActions

  private

  def fetch_objects
    @campaign = Campaign.find(params[:campaign_id])
    @email_template = EmailTemplate.find(params[:id])
    @email_template.enable_custom_signature = @email_template.email_template_signature.present?
  end

  def authorize_for_controller!
    authorize_role(:admin, :call_centre)
    authorize_manage_rights(@campaign)
    authorize_manage_rights(@email_template)
  end

  public

  def update
    update! do |success, failure|
      success.html { redirect_to edit_callers_campaign_path(@campaign) }
    end
  end

end
