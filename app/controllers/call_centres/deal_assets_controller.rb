class CallCentres::DealAssetsController < CallCentres::CallCentreController
  before_filter :set_deal
  before_filter :set_asset, :except => :create

  include ::Controllers::DealAssetActions

  private

  def path
    edit_call_centres_deal_path(@deal)
  end

end