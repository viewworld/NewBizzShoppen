class ContactsAdvancedImportsController < SecuredController
  include AdvancedImportActions

  set_tab "import"

  def create
    @attachment_file = params["attachment"]
    if Sheet.validate_attachment(@attachment_file)
      AdvancedImportProxy.new(@model,
                              @object_id,
                              :advanced_import_contacts_from_xls,
                              @attachment_file,
                              current_user,
                              {
                                  :contact_fields => params[:object_field],
                                  :spreadsheet_fields => params[:spreadsheet_field],
                                  :current_user => current_user,
                                  :unique_only => params[:unique_only]=="1",
                                  :object_id => @object_id
                              }).delay(:queue => current_user_queue).import!
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