class AgentHomeController < ApplicationController

  set_tab "home"

  def show
    @best_sellers = Lead.published_only.without_bought_and_requested_by(current_user).bestsellers.limit(10)
    @latest_leads = Lead.published_only.without_bought_and_requested_by(current_user).latest.limit(10)
    @news         = Article::News.published.for_agent.latest.limit(3)
  end

end
