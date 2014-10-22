module Controllers
  module AdvancedImportActions

    def self.included(base)
      base.class_eval do
        before_filter :set_object, :except => :show
        before_filter :set_role
      end
    end

    def current_user
      @user ||= ::User::CallCentre.find_by_id(super.id)
      @user ||= ::User::CallCentreAgent.find_by_id(super.id)
      @user ||= ::User::Admin.find_by_id(super.id)
      @user ||= ::User::Agent.find_by_id(super.id)
    end

    def show
    end

    def choose
      if !params[:object_field].blank? and !params[:spreadsheet_field].blank?
        @object_field, @spreadsheet_field = params[:object_field], params[:spreadsheet_field]
      end
      if Sheet.validate_attachment(params["attachment"], params["attachment"].class != String)
        @attachment_file = params["attachment"].class == String ? params["attachment"] : Sheet.new_temp_file(params["attachment"])
        @creator_id, @object_id, @unique_only = params[:creator_id], params[:object_id], params[:unique_only]
        @spreadsheet_headers = @model.advanced_import_from_xls_headers(Sheet.new(@attachment_file, true).roo_instance)
        something_went_wrong(t("advanced_import.choose.flash.error_wrong_title")) if @spreadsheet_headers == false
      else
        something_went_wrong(t("advanced_import.choose.flash.error_wrong_file"))
      end
    end

    def preview
      @attachment_file, @object_field, @spreadsheet_field, @creator_id, @object_id, @unique_only = params["attachment"], params[:object_field], params[:spreadsheet_field], params[:creator_id], params[:object_id], params[:unique_only]
      if Sheet.validate_attachment(@attachment_file)
        @objects_to_preview = @model.advanced_import_from_xls_preview(Sheet.new(@attachment_file, true).roo_instance, params[:object_field], params[:spreadsheet_field])
        something_went_wrong(t("advanced_import.preview.flash.error_wrong_fields")) if @objects_to_preview == false
      else
        something_went_wrong(t("advanced_import.preview.flash.error_wrong_file"))
      end
    end

    protected

    def something_went_wrong(message)
      flash[:notice] = message
      redirect_to redirection_path
    end

    def success(message)
      flash[:notice] = message
      redirect_to redirection_path
    end

    def authorize_user_for_namespace!
      authorize_role(:call_centre, :call_centre_agent, :admin, :agent)
    end

    def set_role
      @role = if ::User::CallCentre.find_by_id(current_user.id)
                "call_centre"
              elsif ::User::CallCentreAgent.find_by_id(current_user.id)
                "call_centre_agent"
              elsif ::User::Admin.find_by_id(current_user.id)
                "admin"
              elsif ::User::Agent.find_by_id(current_user.id)
                "agent"
              end
    end
  end
end