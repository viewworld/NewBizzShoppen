class PurchaseManagerHomeController < ApplicationController

  set_tab "home"

  def show
    if user_signed_in? and current_user.has_role?(:purchase_manager)
      @best_sellers = Deal.without_requested_by(current_user).without_inactive.published_only.latest.limit(3)
    else
      @best_sellers = Lead.scoped
      @best_sellers = @best_sellers.without_inactive.published_only.without_bought_and_requested_by(current_user).bestsellers
      if user_signed_in?
        @best_sellers = current_user.has_any_role?(:agent, :call_centre_agent, :purchase_manager) ? @best_sellers.with_agent_unique_categories(current_user.id) : current_user.has_accessible_categories? ? @best_sellers.within_accessible_categories(current_user.accessible_categories_ids) : @best_sellers.with_supplier_unique_categories(current_user.id)
      else
        @best_sellers = @best_sellers.without_unique_categories
      end
      @best_sellers = @best_sellers.limit(3)
    end

    if user_signed_in? and current_user.has_role?(:purchase_manager)
      @my_contact_requests = Lead.with_agent_unique_categories(current_user.id).contact_requests_for(current_user.id).limit(3)
    elsif user_signed_in?
      @latest_leads = Lead.published_only.without_bought_and_requested_by(current_user)
      @latest_leads = (current_user.has_any_role?(:agent, :call_centre_agent) ? @latest_leads.with_agent_unique_categories(current_user.id) : current_user.has_accessible_categories? ? @best_sellers.within_accessible_categories(current_user.accessible_categories_ids) : @best_sellers.with_supplier_unique_categories(current_user.id)).latest.limit(3)
    else
      @latest_leads = Lead.published_only.without_bought_and_requested_by(current_user).without_unique_categories.latest.limit(3)
    end

    @news         = Article::News::PurchaseManager.published.latest.limit(3)
  end

end
