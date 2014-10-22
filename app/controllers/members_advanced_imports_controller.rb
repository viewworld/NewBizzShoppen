class MembersAdvancedImportsController < SecuredController
  include ::Controllers::AdvancedImportActions
  before_filter :check_role

  def create
    @attachment_file = params["attachment"]
    if Sheet.validate_attachment(@attachment_file)
      AdvancedImportProxy.new(@model,
                              nil,
                              :advanced_import_objects_from_xls,
                              @attachment_file,
                              current_user,
                              {
                                  :object_fields => params[:object_field],
                                  :spreadsheet_fields => params[:spreadsheet_field],
                                  :current_user => current_user
                              }).delay(:queue => current_user_queue).import!
      flash[:notice] = t("advanced_import.create.flash.import_queued")
      redirect_to members_advanced_import_path
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
    members_advanced_import_path
  end

  def set_object
    @model = ::User::Member
  end

  def check_role
    unless (current_user.has_any_role?(:call_centre, :call_centre_agent, :agent) and current_user.deal_maker?) or current_user.admin?
      raise CanCan::AccessDenied
    end
  end
end