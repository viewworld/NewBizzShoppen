class AgentHomeController < ApplicationController

  set_tab "home"

  def show
    @best_sellers = Lead.scoped
    @best_sellers = @best_sellers.without_inactive.published_only.without_bought_and_requested_by(current_user).bestsellers
    if user_signed_in?
      @best_sellers = current_user.has_any_role?(:agent, :call_centre, :call_centre_agent, :purchase_manager) ? @best_sellers.with_agent_unique_categories(current_user.id) : current_user.has_accessible_categories? ? @best_sellers.within_accessible_categories(current_user.accessible_categories_ids) : @best_sellers.with_customer_unique_categories(current_user.id)
    else
      @best_sellers = @best_sellers.without_unique_categories
    end
    @best_sellers = @best_sellers.limit(10)

    @latest_leads = Lead.scoped
    @latest_leads = @latest_leads.without_inactive.published_only.without_bought_and_requested_by(current_user)
    if user_signed_in?
      @latest_leads = current_user.has_any_role?(:agent, :call_centre, :call_centre_agent, :purchase_manager) ? @latest_leads.with_agent_unique_categories(current_user.id) : current_user.has_accessible_categories? ? @best_sellers.within_accessible_categories(current_user.accessible_categories_ids) : @best_sellers.with_customer_unique_categories(current_user.id)
    else
      @latest_leads = @latest_leads.without_unique_categories
    end
    @latest_leads = @latest_leads.latest.limit(10)
    @news         = Article::News::Agent.published.latest.limit(3)
  end

end
