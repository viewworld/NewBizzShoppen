class Suppliers::DealAssetsController < Suppliers::SupplierController
  before_filter :set_deal
  before_filter :set_asset, :except => :create

  include ::DealAssetActions

  private

  def path
    edit_suppliers_deal_path(@deal)
  end

end