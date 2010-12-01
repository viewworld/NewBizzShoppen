class AgentHomeController < ApplicationController

  def show
    @best_sellers = Lead.bestsellers.limit(10)
    @latest_leads = Lead.latest.limit(10)
    @news         = Article::News.for_agent.latest.limit(3)
  end

end
