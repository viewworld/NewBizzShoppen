class Administration::UsersController < Administration::AdministrationController
  set_tab "users"

  expose(:user) { params[:id] ? user_class.find(params[:id]) : user_class.new }
  expose(:total_users) { User.count }
  expose(:search) { User.scoped_search(params[:search]) }
  expose(:users) { search.paginate(show_all: params[:show_all], page: params[:page])}

  def new
    user.assign_attributes(:agreement_read => true,
      :certification_level => ["agent", "call_centre_agent", "purchase_manager", "call_centre"].include?(params[:role]) ? User::BRONZE_CERTIFICATION : nil,
      :subscription_plan_id => ["supplier", "category_supplier", "member"].include?(params[:role]) ? SubscriptionPlan.free.active.for_role(params[:role]).first.id : nil)
  end

  def create
    user.assign_attributes(user_params)
    if user.save
      if params[:user_category_supplier]
        user.reload
        user.update_attribute(:buying_category_ids, Array(params[:user_category_supplier][:buying_category_ids]) + Array(user.deal_category_id))
      end

      redirect_to administration_users_path, notice: t("administration.users.create.flash.user_creation_successful")
    else
      render action: :new
    end
  end

  def update
    user = User.find(params[:id]).with_role.assign_attributes(user_params)

    if user.save
      flash[:notice] = t("administration.users.update.flash.user_update_successful")

      if user_params && user_params["roles_to_add"] || user_params["roles_to_remove"] || user_params["locked"]
        redirect_to :back
      else
        redirect_to administration_users_path
      end
    else
      flash[:alert] = user.errors[:base]
      render :action => 'edit'
    end
  end

  def destroy
    user = User.find(params[:id]).with_role

    if user.destroy
      flash[:notice] = I18n.t("administration.users.destroy.flash.user_deletion_successful")
    else
      flash[:notice] = I18n.t("administration.users.destroy.flash.user_deletion_failure")
    end

    redirect_to administration_users_path
  end

  def sign_in_as
    user = User.find(params[:id])
    sign_in(user) unless user.locked_at.present?
    redirect_to root_path
  end

  def lock
    user = User.find(params[:id]).with_role
    user.locked = 'lock'
    user.save(validate: false)

    redirect_to :back, notice: t("administration.users.locked")
  end

  def unlock
    user = User.find(params[:id]).with_role
    user.locked = 'unlock'
    user.save(validate: false)

    redirect_to :back, notice: t("administration.users.unlocked")
  end

  private

  def user_class
    "User::#{params[:role].to_s.camelize}".constantize
  end

  def user_params
    params["user_#{params[:role]}".to_sym]
  end
end
