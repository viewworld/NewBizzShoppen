class CategoryHomeController < ApplicationController

  set_tab "home"

  def show
    @latest_leads = Lead.without_inactive.published_only.with_category(@home_category).without_bought_and_requested_by(current_user).latest.limit(3)
    @news         = @home_category.news.published.latest.limit(3)
    @my_leads     = (user_signed_in? and current_user.has_role? :category_supplier) ? (current_user.parent.nil? ? current_user.bought_leads.latest.limit(3): current_user.assigned_leads.latest.limit(3)) : []
    @auto_buy_category = @home_category.auto_buy and current_user and current_user.has_role?(:category_supplier)
  end

end
