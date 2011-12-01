class Administration::EmailTemplatesController < Administration::AdministrationController
  inherit_resources

  set_tab "settings"
  set_subtab "email_templates"

  include EmailTemplatesActions

  before_filter :set_referer, :only => [:edit]

  def update
    update! do |success, failure|
      success.html { redirect_to session[:articles_referer].blank? ? administration_email_templates_path : session[:articles_referer] }
    end
  end

  protected

  def collection
    @email_templates ||= end_of_association_chain.global.paginate(:page => params[:page], :per_page => EmailTemplate.per_page)
  end

  private

  def set_referer
    session[:articles_referer] = request.referer
  end
end
