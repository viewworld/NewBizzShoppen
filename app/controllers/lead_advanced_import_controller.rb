class LeadAdvancedImportController < SecuredController
  before_filter :set_category

  def current_user
    @user ||= ::User::CallCentre.find_by_id(super.id)
    @user ||= ::User::CallCentreAgent.find_by_id(super.id)
    @user ||= ::User::Admin.find_by_id(super.id)
    @user ||= ::User::Agent.find_by_id(super.id)
  end

  def choose
    if Sheet.validate_attachment(params["attachment"], true)
      @attachment_file = Sheet.new_temp_file(params["attachment"])
      @spreadsheet_headers = @category.advanced_import_from_xls_headers(Sheet.new(@attachment_file, true).roo_instance)
      something_went_wrong(t("callers.advanced_import.choose.flash.error_wrong_title")) if @spreadsheet_headers == false
    else
      something_went_wrong(t("callers.advanced_import.choose.flash.error_wrong_file"))
    end
  end

  def preview
    @attachment_file, @lead_field, @spreadsheet_field = params["attachment"], params[:lead_field], params[:spreadsheet_field]
    if Sheet.validate_attachment(@attachment_file)
      @leads_to_preview = @category.advanced_import_from_xls_preview(Sheet.new(@attachment_file, true).roo_instance, params[:lead_field], params[:spreadsheet_field])
      something_went_wrong(t("callers.advanced_import.preview.flash.error_wrong_fields")) if @leads_to_preview == false
    else
      something_went_wrong(t("callers.advanced_import.preview.flash.error_wrong_file"))
    end
  end

  def create
    @attachment_file = params["attachment"]
    if Sheet.validate_attachment(@attachment_file)
      result = @category.advanced_import_leads_from_xls(Sheet.new(@attachment_file, true).roo_instance, params[:lead_field], params[:spreadsheet_field], current_user)
      something_went_wrong(t("callers.advanced_import.create.flash.error_wrong_fields")) if result == false
      success("#{t("callers.advanced_import.create.flash.success", :counter => result[:counter])}.#{"<br/>Errors:<br/>#{result[:errors]}" unless result[:errors].blank?}".html_safe)
    else
      something_went_wrong(t("callers.advanced_import.create.flash.error_wrong_file"))
    end
  end

  def destroy
    #@campaign.contacts.from_last_import.each { |c| c.destroy }
    success(t("callers.advanced_import.destroy.flash.success"))
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:call_centre, :call_centre_agent, :admin, :agent)
  end

  def something_went_wrong(message)
    flash[:notice] = message
    redirect_to agents_leads_path(:show_import => true)
  end

  def success(message)
    flash[:notice] = message
    redirect_to agents_leads_path
  end

  def set_category
    params[:id] = params[:category_id] if params[:id].blank?
    @category = Category.find(params[:id])
  end

end