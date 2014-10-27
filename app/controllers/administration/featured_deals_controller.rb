class Administration::FeaturedDealsController < Administration::AdministrationController

  set_tab "settings"
  set_subtab "featured_deals"

  def index
    @deals_for_select = Deal.all_deals_for_select
  end

  def create
    FeaturedDeal.set_all(params[:featured_deals])
    redirect_to administration_featured_deals_path, :notice => t("flash.featured_deals.create.notice")
  end
end
