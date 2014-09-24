class Administration::DealAssetsController < Administration::AdministrationController
  before_filter :set_deal
  before_filter :set_asset, except: :create

  include ::DealAssetActions

  private
  def path
    edit_administration_deal_path(@deal)
  end
end
