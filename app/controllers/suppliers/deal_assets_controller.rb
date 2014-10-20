class Suppliers::DealAssetsController < Suppliers::BasicSupplierController
  before_filter :set_deal
  before_filter :set_asset, :except => :create

  include ::Controllers::DealAssetActions

  private

  def path
    edit_suppliers_deal_path(@deal)
  end

end