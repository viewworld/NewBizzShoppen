class LeadsAdvancedImportsController < SecuredController
  include AdvancedImportActions

  def create
    @attachment_file = params["attachment"]
    if Sheet.validate_attachment(@attachment_file)
      result = @model.advanced_import_leads_from_xls(Sheet.new(@attachment_file, true).roo_instance, params[:object_field], params[:spreadsheet_field], current_user.admin? ? User.find(params[:creator_id]) : current_user)
      something_went_wrong(t("advanced_import.create.flash.error_wrong_fields")) if result == false
      success("#{t("leads_advanced_import.create.flash.success", :counter => result[:counter])}.#{"<br/>Errors:<br/>#{result[:errors]}" unless result[:errors].blank?}".html_safe)
    else
      something_went_wrong(t("advanced_import.create.flash.error_wrong_file"))
    end
  end

  def show
    @categories = LeadCategory.without_locked.with_agent_unique(params[:user_id] ? User.find_by_id(params[:user_id]) : current_user).all

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