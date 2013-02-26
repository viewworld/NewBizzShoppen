class AgentHomeController < ApplicationController

  set_tab "home"

  def agent
    @campaigns = Campaign.available_for_user(current_user).with_state("active")
    @call_results = CallResult.order("created_at DESC").where(:creator_id => current_user.call_centre? ? current_user.subaccount_ids+[current_user.id] : current_user.id).first(4)
    @communications = Communication.for_user(current_user.call_centre? ? current_user.subaccount_ids+[current_user.id] : current_user.id).descending_by_created_at.first(4)
    params[:date_from] ||= Date.today
    params[:date_to] ||= Date.today
    @performance_campaigns = Campaign.active_between(params[:date_from], params[:date_to]).available_for_user(current_user)
    render :agent
  end

  def guest
    @best_sellers = Lead.scoped
    @best_sellers = @best_sellers.without_inactive.published_only.without_bought_and_requested_by(current_user).bestsellers
    if user_signed_in?
      @best_sellers = current_user.has_any_role?(:agent, :call_centre, :call_centre_agent, :member) ? @best_sellers.with_agent_unique_categories(current_user.id) : current_user.has_accessible_categories? ? @best_sellers.within_accessible_categories(current_user.accessible_categories_ids) : @best_sellers.with_supplier_unique_categories(current_user.id)
    else
      @best_sellers = @best_sellers.without_unique_categories
    end
    @best_sellers = @best_sellers.limit(3)

    @latest_leads = Lead.scoped
    @latest_leads = @latest_leads.without_inactive.published_only.without_bought_and_requested_by(current_user)
    if user_signed_in?
      @latest_leads = current_user.has_any_role?(:agent, :call_centre, :call_centre_agent, :member) ? @latest_leads.with_agent_unique_categories(current_user.id) : current_user.has_accessible_categories? ? @best_sellers.within_accessible_categories(current_user.accessible_categories_ids) : @best_sellers.with_supplier_unique_categories(current_user.id)
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
