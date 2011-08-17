class DealBuyerAccountsController < ApplicationController
  before_filter :set_deal

  def new
    @user = @deal.build_buyer
  end

  def create
    @user = @deal.build_buyer(params[:user_customer])
    if @user.save
      @deal.current_dcr.change_state("agreed")
      @deal.assign_lead_category_to_buyer!
      @deal.send_buyer_welcome_email(params[:user_customer][:password])
      flash[:notice] = t("buyer.deal_certification_requests.update.flash.certify_success")
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_deal
    @deal = Deal.find(params[:id])
    unless @deal.current_dcr and @deal.current_dcr.active? and (!user_signed_in? and params[:token] == @deal.current_dcr.token)
      flash[:notice] = t("buyer.deal_certification_requests.update.flash.not_authorized")
      redirect_to root_path
    end
  end
end