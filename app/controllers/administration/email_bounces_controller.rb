class Administration::EmailBouncesController < Administration::AdministrationController
  skip_filter :authenticate_user!, only: :create
  skip_filter :authorize_user_for_namespace!, only: :create

  protect_from_forgery except: :create

  before_filter :basic_auth_for_postmark, only: :create

  set_tab "alerts"
  set_subtab "bounce"

  def index
    @search = ArchivedEmail.scoped_search(params[:search])
    @email_bounces = @search.where(status: [ArchivedEmail::NOT_SENT, ArchivedEmail::BOUNCED])
                            .order("bounced_at DESC")
                            .paginate(show_all: params[:show_all], page: params[:page])
                            .decorate
  end

  def show
    @email_bounce = ArchivedEmail.find(params[:id])
  end

  def create
    unless params["MessageID"].blank?
      ArchivedEmail.where(message_id: params["MessageID"]).each do |email|
        email.bounce_details = {
          name: params["Name"],
          inactive: params["Inactive"],
          content: params["Content"],
          tag: params["Tag"],
          details: params["Details"],
          postmark_id: params["ID"],
          can_activate: params["CanActivate"],
          bounced_at: params["BouncedAt"],
          description: params["Description"],
          email: params["Email"],
          type_code: params["TypeCode"],
          dump_available: params["DumpAvailable"]
        }
        email.bounced_at = params["BouncedAt"]
        email.status = ArchivedEmail::BOUNCED
        email.save
      end
    end

    respond_to do |format|
      format.json { render nothing: true }
    end
  end

  private
  # FIXME: Security?
  def basic_auth_for_postmark
    authenticate_or_request_with_http_basic do |user, password|
      user == "LbZXQceTRE" && password == "dxFZQczcKq"
    end
  end
end
