class Buyers::DealAssetsController < Buyers::BuyerController
  before_filter :set_deal

  def create
    @asset = if params[:type] == "logo"
               @deal.build_logo(params[:asset_deal_logo])
             elsif params[:type] == "picture"
               @deal.images.build(params[:asset_deal_logo])
             elsif params[:type] == "material"
               @deal.materials.build(params[:asset_deal_logo])
             else
               flash[:notice] = "Asset type is incorrect!"
               nil
             end
    if @asset
      @asset.resource_id = @deal.id
      @asset.resource_type = "AbstractLead"
      @asset.save
      flash[:notice] = "Asset has been successfully added."
    end
    redirect_to edit_buyers_deal_path(@deal)
  end

  def destroy
    @asset = Asset.find(params)
    @asset.destroy
    redirect_to edit_buyers_deal_path(@deal)
  end

  private

  def set_deal
    @deal = Deal.find(params[:deal_id])
  end

end