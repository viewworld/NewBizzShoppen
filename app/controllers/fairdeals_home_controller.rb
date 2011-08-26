class FairdealsHomeController < ApplicationController

  set_tab "home"

  def show
    @primary_deal = Deal.where(:id => params[:id]).first || FeaturedDeal.primary
    @news = Article::News::PurchaseManager.published.latest.limit(3)
  end

end
