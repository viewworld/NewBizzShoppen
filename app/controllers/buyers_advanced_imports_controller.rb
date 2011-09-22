class BuyersAdvancedImportsController < SecuredController
  include AdvancedImportActions

  def create
    @attachment_file = params["attachment"]
    if Sheet.validate_attachment(@attachment_file)
      result = @model.advanced_import_objects_from_xls(Sheet.new(@attachment_file, true).roo_instance, params[:object_field], params[:spreadsheet_field], current_user, @object_id)
      something_went_wrong(t("advanced_import.create.flash.error_wrong_fields")) if result == false
      success("#{t("buyers_advanced_import.create.flash.success", :counter => result[:counter])}.#{"<br/>Errors:<br/>#{result[:errors]}" unless result[:errors].blank?}".html_safe)
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
    buyers_advanced_import_path
  end

  def set_object
    unless params[:object_id].blank?
      @object_id = params[:object_id]
      @model = ::User::CategoryBuyer
    else
      @model = ::User::Customer
    end
  end

end