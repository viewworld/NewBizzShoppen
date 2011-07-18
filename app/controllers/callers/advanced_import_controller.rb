class Callers::AdvancedImportController < SecuredController

  before_filter :set_campaign

  def choose
    if Sheet.validate_attachment(params["attachment"], true)
      @attachment_file = Sheet.new_temp_file(params["attachment"])
      @spreadsheet_headers = @campaign.advanced_import_from_xls_headers(Sheet.new(@attachment_file, true).roo_instance)
      something_went_wrong(t("callers.advanced_import.choose.flash.error_wrong_title")) if @spreadsheet_headers == false
    else
      something_went_wrong(t("callers.advanced_import.choose.flash.error_wrong_file"))
    end
  end

  def preview
    @attachment_file, @contact_field, @spreadsheet_field = params["attachment"], params[:contact_field], params[:spreadsheet_field]
    if Sheet.validate_attachment(@attachment_file)
      @contacts_to_preview = @campaign.advanced_import_from_xls_preview(Sheet.new(@attachment_file, true).roo_instance, params[:contact_field], params[:spreadsheet_field])
      something_went_wrong(t("callers.advanced_import.preview.flash.error_wrong_fields")) if @contacts_to_preview == false
    else
      something_went_wrong(t("callers.advanced_import.preview.flash.error_wrong_file"))
    end
  end

  def create
    @attachment_file = params["attachment"]
    if Sheet.validate_attachment(@attachment_file)
      result = @campaign.advanced_import_contacts_from_xls(Sheet.new(@attachment_file, true).roo_instance, params[:contact_field], params[:spreadsheet_field], current_user)
      something_went_wrong(t("callers.advanced_import.create.flash.error_wrong_fields")) if result == false
      success("#{t("callers.advanced_import.create.flash.success", :counter => result[:counter])}.#{"<br/>Errors:<br/>#{result[:errors]}" unless result[:errors].blank?}".html_safe)
    else
      something_went_wrong(t("callers.advanced_import.create.flash.error_wrong_file"))
    end
  end

  def destroy
    @campaign.contacts.from_last_import.each { |c| c.destroy }
    success(t("callers.advanced_import.destroy.flash.success"))
  end

  private

  def something_went_wrong(message)
    flash[:notice] = message
    redirect_to new_callers_campaign_contact_path(@campaign, :type => "import")
  end

  def success(message)
    flash[:notice] = message
    redirect_to edit_callers_campaign_path(@campaign)
  end

  def set_campaign
    params[:id] = params[:campaign_id] if params[:id].blank?
    @campaign = Campaign.find(params[:id])
  end

end