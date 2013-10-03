class SubscribersAdvancedImportsController < SecuredController
  include AdvancedImportActions

  set_tab "import"
  set_subtab "import_subscribers"

  def show
    @lists = (current_user.admin? ? NewsletterList.scoped : NewsletterList.created_or_owned_by(current_user)).without_archived.order(:name)
    @lists = @lists.map { |nl| [nl.name, nl.id] }
  end

  def create
    @attachment_file = params["attachment"]
    if Sheet.validate_attachment(@attachment_file)
      AdvancedImportProxy.new(@model,
                              @object_id,
                              :advanced_import_subscribers_from_xls,
                              @attachment_file,
                              current_user,
                              {
                                  :subscriber_fields => params[:object_field],
                                  :spreadsheet_fields => params[:spreadsheet_field],
                                  :current_user => current_user,
                                  :object_id => @object_id
                              }).delay(:queue => current_user_queue).import!
      flash[:notice] = t("advanced_import.create.flash.import_queued")
      redirect_to subscribers_advanced_import_path
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
    subscribers_advanced_import_path
  end

  def set_object
    @model = NewsletterList
    @object_id = params[:object_id]
  end

end