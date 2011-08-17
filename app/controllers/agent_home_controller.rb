class AgentHomeController < ApplicationController

  set_tab "home"

  def agent
    @new_leads = current_user.leads.without_outdated.without_inactive.order("created_at DESC").limit(3)
    @new_comments = current_user.comment_threads.order("last_thread_created_at DESC").limit(3)
    @sold_leads = current_user.leads.joins_on_lead_purchases.purchased.order("lead_purchases.created_at DESC").limit(3)
    render :agent
  end

  def guest
    @best_sellers = Lead.scoped
    @best_sellers = @best_sellers.without_inactive.published_only.without_bought_and_requested_by(current_user).bestsellers
    if user_signed_in?
      @best_sellers = current_user.has_any_role?(:agent, :call_centre, :call_centre_agent, :purchase_manager) ? @best_sellers.with_agent_unique_categories(current_user.id) : current_user.has_accessible_categories? ? @best_sellers.within_accessible_categories(current_user.accessible_categories_ids) : @best_sellers.with_customer_unique_categories(current_user.id)
    else
      @best_sellers = @best_sellers.without_unique_categories
    end
    @best_sellers = @best_sellers.limit(3)

    @latest_leads = Lead.scoped
    @latest_leads = @latest_leads.without_inactive.published_only.without_bought_and_requested_by(current_user)
    if user_signed_in?
      @latest_leads = current_user.has_any_role?(:agent, :call_centre, :call_centre_agent, :purchase_manager) ? @latest_leads.with_agent_unique_categories(current_user.id) : current_user.has_accessible_categories? ? @best_sellers.within_accessible_categories(current_user.accessible_categories_ids) : @best_sellers.with_customer_unique_categories(current_user.id)
    else
      @latest_leads = @latest_leads.without_unique_categories
    end
    @latest_leads = @latest_leads.latest.limit(3)
    render :guest
  end

  def show
    if user_signed_in? and current_user.has_any_role?(:call_centre_agent)
      @news = Article.for_call_centre_agent(current_user).published.latest.limit(3)
    else
      @news = Article::News::Agent.published.latest.limit(3)
    end

    if user_signed_in? and current_user.has_any_role?(:agent, :call_centre_agent, :call_centre)
      agent
    else
      guest
    end
  end

end
