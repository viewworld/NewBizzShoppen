class Customer::SubaccountsController < ApplicationController
  before_filter :check_roles_selection, :only => [:new, :create]

  def index
    @users = User.where({:parent_id => current_user.id})
  end

  def new
    @user = "User::#{params[:role].to_s.camelize}".constantize.new
  end

  def create
    @user = "User::#{params[:role].to_s.camelize}".constantize.new(params["user_#{params[:role].to_s}"])
    @user.parent_id = current_user.id
    if @user.save
      flash[:notice] = "User created!"
       redirect_to customer_subaccounts_path
    else
      render :action => 'new'
    end
  end

  def edit
    @user = "User::#{User.find(params[:id]).role.to_s.camelize}".constantize.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    "User::#{@user.role.to_s.camelize}".constantize.find(params[:id])
      if @user.update_attributes(params["user_#{@user.role.to_s}".to_sym])
        redirect_to customer_subaccounts_path
      else
        render :action => 'edit'
      end
  end

  protected

  def check_roles_selection
    unless ['lead_user', 'lead_buyer'].include?(params[:role])
      raise CanCan::AccessDenied
    end
  end

end
