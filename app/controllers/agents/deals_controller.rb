class Agents::DealsController < Agents::AgentController
  before_filter :set_deal, :only => [:edit, :update, :destroy]
  before_filter :prepare_assets, :only => [:edit, :update]
  before_filter :check_user

  include ::DealActions
  include ::DealCreateActions

  private

  def success(message)
    flash[:notice] = message
    success_redirect_to("agents")
  end

end