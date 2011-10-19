class Administration::FeaturedDealsController < Administration::AdministrationController

  set_tab "settings"
  set_subtab "featured_deals"

  def index
    @deals_for_select = Deal.all_deals_for_select
    @featured_deals = FeaturedDeal.display_all
  end

  def create
    FeaturedDeal.set_all(params[:featured_deals])
    flash[:notice] = I18n.t("flash.featured_deals.create.notice")
    redirect_to administration_featured_deals_path
  end

end