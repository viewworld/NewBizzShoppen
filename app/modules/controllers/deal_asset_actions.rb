module DealAssetActions

  def create
    @asset = if params[:type] == "logo"
               @deal.build_logo(params[:asset_deal_logo])
             elsif params[:type] == "image"
               @deal.images.build(params[:asset_deal_image])
             elsif params[:type] == "material"
               @deal.materials.build(params[:asset_deal_material])
             else
               flash[:notice] = t("flash.deal_assets.create.type_is_incorrect")
               nil
             end
    if @asset
      @asset.assetable_id = @deal.id
      @asset.assetable_type = "AbstractLead"
      if @asset.save
        flash[:notice] = t("flash.deal_assets.create.success")
      else
        flash[:alert] = t("flash.deal_assets.create.asset_is_invalid")
      end
    end
    redirect_to path
  end

  def destroy
    @asset.destroy
    flash[:notice] = t("flash.deal_assets.destroy.success")
    redirect_to path
  end

  private

  def set_deal
    @deal = Deal.find(params[:deal_id])
  end

  def set_asset
    @asset = Asset.find(params[:id])
  end

end
