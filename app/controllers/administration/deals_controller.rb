class Administration::DealsController < Administration::AdministrationController
  before_filter :set_deal, :only => [:edit, :update, :destroy]
  before_filter :prepare_assets, :only => [:edit, :update]

  include ::DealActions

  def new
    @deal = Deal.new_for_user(current_user)
  end

  def create
    @deal = current_user.deals.build(params[:deal])
    if @deal.save
      @deal.reload
      @deal.deal_template_ids = params[:deal][:deal_template_ids]
      @deal.save
      success(t("flash.deals.create.notice"))
    else
      render(:new)
    end
  end

  private

  def success(message)
    flash[:notice] = message
    redirect_to buyers_deals_path
  end
end