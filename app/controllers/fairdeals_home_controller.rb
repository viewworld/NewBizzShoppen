class FairdealsHomeController < ApplicationController

  set_tab "home"

  def show
    @news         = Article::News::PurchaseManager.published.latest.limit(3)
  end

end
