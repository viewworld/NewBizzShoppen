class DealSupplierAccountsController < ApplicationController
  before_filter :set_deal

  def new
    @user = @deal.build_supplier
  end

  def create
    @user = @deal.build_supplier(params[:user_supplier])
    if @user.save
      @deal.current_dcr.change_state("agreed")
      @deal.assign_lead_category_to_supplier!
      @deal.send_supplier_welcome_email(params[:user_supplier][:password])
      flash[:notice] = t("supplier.deal_certification_requests.update.flash.certify_success")
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_deal
    @deal = Deal.find(params[:id])
    unless @deal.current_dcr and @deal.current_dcr.active? and (!user_signed_in? and params[:token] == @deal.current_dcr.token)
      flash[:notice] = t("supplier.deal_certification_requests.update.flash.not_authorized")
      redirect_to root_path
    end
  end
end