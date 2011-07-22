class CallCentreAgents::DealAssetsController < CallCentreAgents::CallCentreAgentController
  before_filter :set_deal
  before_filter :set_asset, :except => :create

  include ::DealAssetActions

  private

  def path
    edit_call_centre_agent_deal_path(@deal)
  end

end