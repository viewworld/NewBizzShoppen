class Administration::EmailTemplateSignaturesController < Administration::AdministrationController
  inherit_resources

  set_tab "settings"
  set_subtab "email_template_signatures"

  def create
    create! do |success, failure|
      success.html { redirect_to administration_email_template_signatures_path }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to administration_email_template_signatures_path }
    end
  end

  protected

  def collection
    @email_template_signatures ||= end_of_association_chain.custom.paginate(:show_all => params[:show_all], :page => params[:page], :per_page => EmailTemplateSignature.per_page)
  end
end
