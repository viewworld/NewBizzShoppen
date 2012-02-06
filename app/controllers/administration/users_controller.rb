class Administration::UsersController < Administration::AdministrationController
  inherit_resources
  actions :all, :except => [:create, :update]

  set_tab "users"

  def new
    @user = "User::#{params[:role].to_s.camelize}".constantize.new(:agreement_read => true,
             :certification_level => ["agent", "call_centre_agent", "purchase_manager", "call_centre"].include?(params[:role]) ? User::BRONZE_CERTIFICATION : nil,
             :subscription_plan_id => ["supplier", "category_supplier", "member"].include?(params[:role]) ? SubscriptionPlan.free.active.for_role(params[:role]).first.id : nil)
  end

  def create
    @user = "User::#{params[:role].to_s.camelize}".constantize.new
    @user.send(:attributes=, params["user_#{params[:role].to_s}".to_sym], false)
    if @user.save
       if params[:user_category_supplier]
        @user.reload
        @user.update_attribute(:buying_category_ids, params[:user_category_supplier][:buying_category_ids])
       end
      flash[:notice] = t("administration.users.create.flash.user_creation_successful")
      redirect_to administration_users_path
    else
      render :action => 'new'
    end
  end

  def edit
    @user = "User::#{User.find(params[:id]).role.to_s.camelize}".constantize.find(params[:id])
  end

  def update
    @user = User.find(params[:id]).send(:casted_class).find(params[:id])
    user_params_key = "user_#{@user.role.to_s}"
    @user.send(:attributes=, params[user_params_key], false)

    if @user.save
      flash[:notice] = t("administration.users.update.flash.user_update_successful")
      if params[user_params_key]["roles_to_add"] or params[user_params_key]["roles_to_remove"] or params[user_params_key]["locked"]
        redirect_to :back
      else
        redirect_to administration_users_path
      end
    else
      flash[:alert] = @user.errors[:base]
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id]).send(:casted_class).find(params[:id])
    if @user.destroy
      flash[:notice] = I18n.t("administration.users.destroy.flash.user_deletion_successful")
    else
      flash[:notice] = I18n.t("administration.users.destroy.flash.user_deletion_failure")
    end
    redirect_to administration_users_path
  end

  def sign_in_as
    user = User.find(params[:id])
    sign_in(user)
    redirect_to root_path
  end

  protected

  def collection
    @total_users = User.count
    @search = User.scoped_search(params[:search])
    @users = @search.paginate(:page => params[:page])
  end

end