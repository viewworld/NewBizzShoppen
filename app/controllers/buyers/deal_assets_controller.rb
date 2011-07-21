class Buyers::DealAssetsController < Buyers::BuyerController
  before_filter :set_deal
  before_filter :set_asset, :except => :create

  def create
    @asset = if params[:type] == "logo"
               @deal.build_logo(params[:asset_deal_logo])
             elsif params[:type] == "image"
               @deal.images.build(params[:asset_deal_image])
             elsif params[:type] == "material"
               @deal.materials.build(params[:asset_deal_material])
             else
               flash[:notice] = "Asset type is incorrect!"
               nil
             end
    if @asset
      @asset.resource_id = @deal.id
      @asset.resource_type = "AbstractLead"
      if @asset.save
        flash[:notice] = "Asset has been successfully added."
      else
        flash[:alert] = "Asset is invalid"
      end
    end
    redirect_to edit_buyers_deal_path(@deal)
  end

  def destroy
    @asset.destroy
    redirect_to edit_buyers_deal_path(@deal)
  end

  def download
    send_file @asset.asset.path
  end

  private

  def set_deal
    @deal = Deal.find(params[:deal_id])
  end

  def set_asset
    @asset = Asset.find(params[:id])
  end

end