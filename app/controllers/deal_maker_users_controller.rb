class DealMakerUsersController < SecuredController

  before_filter :check_role

  def index
    params[:search] ||= {}
    params[:search][:created_by] = current_user.id
    @search = User.scoped_search(params[:search])
    @users = @search.order("email").paginate(:page => params[:page])
  end

  def new
    @user = "User::#{params[:user_type] == "member" ? "PurchaseManager" : "Customer"}".constantize.new(:big_buyer => (params[:user_type] == "supplier"), :auto_generate_password => true)
    @user.skip_email_verification = true
  end

  def create
    @user = "User::#{params[:user_type] == "member" ? "PurchaseManager" : "Customer"}".constantize.new(params[:user])
    @user.skip_email_verification = params[:user][:skip_email_verification]
    @user.created_by = current_user.id
    if @user.save
      flash[:notice] = t("deal_maker_users.create.flash.user_creation_successful")
      redirect_to deal_maker_users_path
    else
      render :action => 'new'
    end
  end

  def update
    @user = User.find(params[:id]).with_role
    @user.send_invitation_email
    flash[:notice] = t("deal_maker_users.update.flash.invitation_sent")
    redirect_to :back
  end

  protected

  def check_role
    raise CanCan::AccessDenied unless user_signed_in? and current_user.has_role?(:deal_maker) and current_user.has_any_role?(:call_centre, :call_centre_agent, :agent)
  end
end