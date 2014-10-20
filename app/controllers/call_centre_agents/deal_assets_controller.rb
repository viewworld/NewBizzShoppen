class CallCentreAgents::DealAssetsController < CallCentreAgents::CallCentreAgentController
  before_filter :set_deal
  before_filter :set_asset, :except => :create

  include ::Controllers::DealAssetActions

  private

  def path
    edit_call_centre_agents_deal_path(@deal)
  end

end