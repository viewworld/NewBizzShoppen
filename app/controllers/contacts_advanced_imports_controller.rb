class ContactsAdvancedImportsController < SecuredController
  include AdvancedImportActions

  def create
    @attachment_file = params["attachment"]
    if Sheet.validate_attachment(@attachment_file)
      AdvancedImportProxy.new(@model.find(@object_id), @attachment_file, params[:object_field], params[:spreadsheet_field], current_user, params[:unique_only]=="1").delay(:queue => current_user_queue).import!
      flash[:notice] = t("advanced_import.create.flash.import_queued")
      redirect_to contacts_advanced_import_path
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