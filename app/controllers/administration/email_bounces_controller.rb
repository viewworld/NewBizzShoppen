class Administration::EmailBouncesController < Administration::AdministrationController
  inherit_resources

  skip_filter :authenticate_user!, :only => [:create]
  skip_filter :authorize_user_for_namespace!, :only => [:create]

  protect_from_forgery :except => [:create]

  before_filter :basic_auth_for_postmark, :only => [:create]

  set_tab "alerts"
  set_subtab "bounce"

  def create
    EmailBounce.create!(
      :subject => params["Subject"],
      :name => params["Name"],
      :inactive => params["Inactive"],
      :content => params["Content"],
      :tag => params["Tag"],
      :message_id => params["MessageID"],
      :details => params["Details"],
      :postmark_id => params["ID"],
      :can_activate => params["CanActivate"],
      :bounced_at => params["BouncedAt"],
      :description => params["Description"],
      :email => params["Email"],
      :type_code => params["TypeCode"],
      :dump_available => params["DumpAvailable"]
    )
    respond_to do |format|
      format.json { render :nothing => true }
    end
  end

  private

  def basic_auth_for_postmark
    authenticate_or_request_with_http_basic do |user, password|
      user == "LbZXQceTRE" && password == "dxFZQczcKq"
    end
  end

  def collection
    @search = EmailBounce.scoped_search(params[:search])
    @email_bounces = @search.order("bounced_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

end