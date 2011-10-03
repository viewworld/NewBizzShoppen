class Suppliers::DealsController < Suppliers::SupplierController
  before_filter :set_deal, :only => [:edit, :update, :destroy]
  before_filter :prepare_assets, :only => [:edit, :update]

  include ::DealActions

  def new
    @template = LeadTemplate.find_by_id(params[:template_id])
    @deal = Deal.new_for_user(current_user)
  end

  def create
    @deal = current_user.deals.build(params[:deal])
    @deal.min_created_leads = Settings.default_group_deal_min_leads_created.to_i
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
    redirect_to suppliers_deals_path
  end

end