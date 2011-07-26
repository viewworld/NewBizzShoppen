class Buyers::DealAssetsController < Buyers::BuyerController
  before_filter :set_deal
  before_filter :set_asset, :except => :create

  include ::DealAssetActions

  private

  def path
    edit_buyers_deal_path(@deal)
  end

end