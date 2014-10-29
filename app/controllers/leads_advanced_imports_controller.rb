class LeadsAdvancedImportsController < SecuredController
  include ::Controllers::AdvancedImportActions

  def create
    @attachment_file = params["attachment"]
    if Sheet.validate_attachment(@attachment_file)
      AdvancedImportProxy.new(@model,
                              @object_id,
                              :advanced_import_leads_from_xls,
                              @attachment_file,
                              current_user,
                              {
                                  :lead_fields => params[:object_field],
                                  :spreadsheet_fields => params[:spreadsheet_field],
                                  :current_user => (current_user.admin? ? User.find(params[:creator_id]) : current_user)
                              }).delay(:queue => current_user_queue).import!
      flash[:notice] = t("advanced_import.create.flash.import_queued")
      redirect_to leads_advanced_import_path
    else
      something_went_wrong(t("advanced_import.create.flash.error_wrong_file"))
    end
  end

  def show
    @categories = LeadCategory.with_agent_unique(params[:user_id] ? User.find_by_id(params[:user_id]) : current_user).without_locked.all

    respond_to do |format|
      format.html { }
      format.js {}
    end
  end

  private

  def redirection_path
    leads_advanced_import_path
  end

  def set_object
    @object_id = params[:object_id]
    @model = LeadCategory.find(@object_id)
  end

end
