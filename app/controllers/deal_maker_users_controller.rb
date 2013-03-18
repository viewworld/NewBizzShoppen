class DealMakerUsersController < SecuredController

  before_filter :check_role

  def index
    params[:search] ||= {}
    params[:search][:created_by] = current_user.id
    @search = User.scoped_search(params[:search])
    @users = @search.order("email").paginate(:show_all => params[:show_all], :page => params[:page])
  end

  def new
    @materials = []
    @user = "User::#{params[:user_type] == "member" ? "Member" : "CategorySupplier"}".constantize.new(:auto_generate_password => true, :assign_free_subscription_plan => true)
    @user.skip_email_verification = true
  end

  def create
    all_materials = eval(params[:serialized_materials_array_field].to_s).to_a
    @materials = current_user.materials.where(:id => all_materials.map{ |r| r.first })
    @user = "User::#{params[:user_type] == "member" ? "Member" : "CategorySupplier"}".constantize.new(params[:user])
    @user.skip_email_verification = params[:user][:skip_email_verification]
    @user.created_by = current_user.id
    @user.email_materials = @materials.select { |m| !all_materials.detect{ |am| am.first.to_i == m.id and am.last.to_i == 1 }.nil? }
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
    raise CanCan::AccessDenied unless user_signed_in? and current_user.deal_maker? and current_user.has_any_role?(:call_centre, :call_centre_agent, :agent)
  end
end