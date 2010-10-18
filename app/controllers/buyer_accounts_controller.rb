class BuyerAccountsController < ApplicationController
  def new
    @user = User::Buyer.new(:newsletter_on => true)
  end

  def create
    @user = User::Buyer.new(params[:user_buyer])
    respond_to do  |format|
      format.html { @user.save ? redirect_to(root_path) : render("new")}
    end
  end
end
