class Buyers::DealCertificationRequestsController < Buyers::BuyerController

  before_filter :set_deal, :only => [:edit, :update]

  def index
    @deal_certification_requests = current_user.deal_certification_requests
  end

  def edit
  end

  def update
    if @deal.update_attributes(params[:deal])
      @deal.current_dcr.change_state(params[:accept] == "true" ? "agreed" : "fail")
      flash[:notice] = params[:accept] == "true" ? t("buyer.deal_certification_requests.update.flash.certify_success") : t("buyer.deal_certification_requests.update.flash.reject_success")
      redirect_to current_user.deal_certification_requests.blank? ? root_path : buyers_deal_certification_requests_path
    else
      render :edit
    end
  end

  private

  def set_deal
    @deal = Deal.find(params[:id])
    unless (@deal.current_dcr and @deal.current_dcr.active? and @deal.current_dcr.email == current_user.email)
      flash[:notice] = t("buyer.deal_certification_requests.update.flash.not_authorized")
      redirect_to root_path
    end
  end

end