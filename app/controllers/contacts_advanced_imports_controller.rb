class ContactsAdvancedImportsController < SecuredController
  include AdvancedImportActions

  def create
    @attachment_file = params["attachment"]
    if Sheet.validate_attachment(@attachment_file)
      result = @model.advanced_import_contacts_from_xls(Sheet.new(@attachment_file, true).roo_instance, params[:object_field], params[:spreadsheet_field], current_user, @object_id, params[:unique_only]=="1")
      something_went_wrong(t("advanced_import.create.flash.error_wrong_fields")) if result == false
      success("#{t("contacts_advanced_import.create.flash.success", :counter => result[:counter])}.#{"<br/>Errors:<br/>#{result[:errors]}" unless result[:errors].blank?}".html_safe)
    else
      something_went_wrong(t("advanced_import.create.flash.error_wrong_file"))
    end
  end

  def destroy
    @campaign.contacts.from_last_import.each { |c| c.destroy }
    success(t("advanced_import.destroy.flash.success"))
  end

  private

  def redirection_path
    contacts_advanced_import_path
  end

  def set_object
    @model = Campaign
    @object_id = params[:object_id]
  end

end