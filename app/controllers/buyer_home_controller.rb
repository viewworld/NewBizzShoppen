class BuyerHomeController < ApplicationController

  def show
    @best_sellers = Lead.bestsellers.limit(10)
    @latest_leads = Lead.latest.limit(10)
  end

end
