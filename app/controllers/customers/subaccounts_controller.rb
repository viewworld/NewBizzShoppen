class Customers::SubaccountsController < Customers::CustomerController
  before_filter :check_roles_selection, :only => [:new, :create]
  before_filter :authorize_for_team_buyers

  set_tab "subaccounts"

  def index
    per_page = params[:per_page].blank? ? 25 : params[:per_page].to_i
    params[:search] ||= {}
    params[:search][:with_subaccounts] = current_user.id

    @search = User.scoped_search(params[:search])

    @users = if per_page == 0
               @search.all
             else
               @search.paginate(:per_page => per_page, :page => params[:page])
             end
  end

  def new
    @user = "User::#{params[:role].to_s.camelize}".constantize.new(:lead_buyer_role_enabled => params[:role] == "lead_buyer" ? true : false)
  end

  def create
    @user = "User::#{params[:role].to_s.camelize}".constantize.new(params["user_#{params[:role].to_s}"])
    @user.parent_id = current_user.id
    if @user.save
      flash[:notice] = t("customer.subaccounts.create.flash.subaccount_creation_successful")
       redirect_to customers_subaccounts_path
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id]).send(:casted_class).find(params[:id])
  end

  def update
    @user = User.find(params[:id]).send(:casted_class).find(params[:id]) 
    user_params = params["user_#{@user.role.to_s}".to_sym]
    if user_params and user_params[:locked]
      @user.locked = user_params[:locked]
    end
    if @user.update_attributes(user_params)
      flash[:notice] = I18n.t("customer.subaccounts.update.flash.subaccount_update_successful")
      redirect_to customers_subaccounts_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id]).send(:casted_class).find(params[:id])
    if @user.destroy
      flash[:notice] = I18n.t("customer.subaccounts.destroy.flash.subaccount_deletion_successful")
    else
      flash[:notice] = I18n.t("customer.subaccounts.destroy.flash.subaccount_deletion_failure")
    end
    redirect_to customers_subaccounts_path
  end

  protected

  def check_roles_selection
    unless ['lead_user', 'lead_buyer'].include?(params[:role])
      raise CanCan::AccessDenied
    end
  end

end
