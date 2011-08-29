class Administration::FeaturedDealsController < Administration::AdministrationController

  set_tab "settings"
  set_subtab "featured_deals"

  def index
    @group_deals_for_select = Deal.group_deals_for_select
    @featured_deals = FeaturedDeal.display_all
  end

  def create
    FeaturedDeal.set_all(params[:featured_deals])
    flash[:notice] = "Featured deals have been updated."
    redirect_to administration_featured_deals_path
  end

end