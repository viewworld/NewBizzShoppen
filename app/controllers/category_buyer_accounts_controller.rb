#require "app/models/user/customer"
class CategoryBuyerAccountsController < ApplicationController
  before_filter :redirect_to_root_path_if_signed_in

  def new
    @user = User::CategoryBuyer.new(:newsletter_on => true, :buying_categories => [@home_category])
  end

  def create
    @user = ::User::CategoryBuyer.new(params[:user_category_buyer])
    respond_to do  |format|
      if @user.save
        flash[:notice] = I18n.t("flash.category_buyer_accounts.actions.create.notice")
        format.html { redirect_to category_home_page_path(@home_category.cached_slug) }
      else
        format.html { render("new")}
      end
    end
  end
end
