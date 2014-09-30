class Administration::UsersController < Administration::AdministrationController
  set_tab 'users'

  before_filter :set_user, only: [:lock, :unlock, :update, :edit, :destroy, :sign_in_as]

  def index
    @total_users = User.count
    @search = User.scoped_search(params[:search])
    @users = @search.paginate(show_all: params[:show_all], page: params[:page])
  end

  def new
    @user = "User::#{params[:role].to_s.camelize}".constantize.new(
      agreement_read: true,
      certification_level: ['agent', 'call_centre_agent', 'purchase_manager', 'call_centre'].include?(params[:role]) ? User::BRONZE_CERTIFICATION : nil,
      subscription_plan_id: ['supplier', 'category_supplier', 'member'].include?(params[:role]) ? SubscriptionPlan.free.active.for_role(params[:role]).first.id : nil
    )
  end

  def create
    @user = "User::#{params[:role].to_s.camelize}".constantize.new(user_params)

    if @user.save
      if user_params[:user_category_supplier]
        @user.update_attribute(:buying_category_ids, Array(params[:user_category_supplier][:buying_category_ids]) + Array(@user.deal_category_id))
      end

      redirect_to administration_users_path, notice: t('administration.users.create.flash.user_creation_successful')
    else
      render :new
    end
  end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = t('administration.users.update.flash.user_update_successful')

      if user_params && user_params['roles_to_add'] || params['roles_to_remove'] || params['locked']
        redirect_to :back
      else
        redirect_to administration_users_path
      end
    else
      flash[:alert] = @user.errors[:base]
      render :edit
    end
  end

  def destroy
    notice = @user.destroy ? :user_deletion_successful : :user_deletion_failure
    redirect_to administration_users_path, notice: t(notice, scope: 'administration.users.destroy.flash')
  end

  def sign_in_as
    sign_in(@user) unless @user.locked_at?
    redirect_to root_path
  end

  def lock
    @user.lock!
    redirect_to :back, notice: t('administration.users.locked')
  end

  def unlock
    @user.unlock!
    redirect_to :back, notice: t('administration.users.unlocked')
  end

  private
  def set_user
    @user = User.find(params[:id]).with_role
  end

  def user_params
    params["user_#{(@user ? @user.role.to_s : params[:role]).to_s}"]
  end
end
