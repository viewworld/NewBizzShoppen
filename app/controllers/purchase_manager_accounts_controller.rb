class PurchaseManagerAccountsController < ApplicationController
  before_filter :redirect_to_root_path_if_signed_in

  def new
    @user = User::PurchaseManager.new(:newsletter_on => true)
  end

  def create
    @user = User::PurchaseManager.new(params[:user_purchase_manager])
    respond_to do |format|
      if @user.save
        flash[:notice] = I18n.t("flash.purchase_manager_accounts.actions.create.notice")
        format.html {  redirect_to(root_path) }
      else
        format.html {  render("new") }
      end
    end
  end
end
