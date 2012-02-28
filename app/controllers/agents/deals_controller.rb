class Agents::DealsController < Agents::AgentController
  before_filter :set_deal, :only => [:edit, :update, :destroy]
  before_filter :prepare_assets, :only => [:edit, :update]
  before_filter :check_user
  cache_sweeper :deal_sweeper

  include ::DealActions
  include ::DealCreateActions

  private

  def success(message)
    flash[:notice] = message
    redirect_to agents_deals_path
  end

end