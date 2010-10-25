#require "app/models/user/customer"
class BuyerAccountsController < ApplicationController
  before_filter :redirect_to_root_path_if_signed_in

  def new
    @user = User::Customer.new(:newsletter_on => true)
  end

  def create
    @user = ::User::Customer.new(params[:user_customer])
    respond_to do  |format|
      format.html { @user.save ? redirect_to(root_path) : render("new")}
    end
  end
end
