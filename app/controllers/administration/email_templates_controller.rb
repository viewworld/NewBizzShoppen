class Administration::EmailTemplatesController < Administration::AdministrationController
  inherit_resources

  def update
    update! do |success, failure|
      success.html { redirect_to administration_email_templates_path }
    end
  end

  protected
    def collection
      @email_templates ||= end_of_association_chain.paginate(:page => params[:page])
    end
end
