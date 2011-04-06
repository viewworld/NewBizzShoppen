#require "app/models/user/customer"
class BuyerAccountsController < ApplicationController
  before_filter :redirect_to_root_path_if_signed_in

  def new
    @user = User::Customer.new(:newsletter_on => true)
  end

  def create
    @user = ::User::Customer.new(params[:user_customer])
    respond_to do  |format|
      if @user.save
        flash[:notice] = I18n.t("flash.buyer_accounts.create.notice")
        format.html { redirect_to(root_path)}
      else
        format.html { render("new")}
      end
    end
  end
end
