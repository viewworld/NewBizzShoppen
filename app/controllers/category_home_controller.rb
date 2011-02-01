class CategoryHomeController < ApplicationController

  set_tab "home"

  def show
    @latest_leads = Lead.published_only.with_category(@home_category).without_bought_and_requested_by(current_user).latest.limit(10)
  end

end
