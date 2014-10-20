class Agents::DealAssetsController < Agents::AgentController
  before_filter :set_deal
  before_filter :set_asset, :except => :create

  include ::Controllers::DealAssetActions

  private

  def path
    edit_agents_deal_path(@deal)
  end

end