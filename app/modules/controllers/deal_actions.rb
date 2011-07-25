module DealActions

  def destroy
    @deal.destroy
    success(t("flash.deals.destroy.notice"))
  end

  def index
    @search = Deal.scoped_search(params[:search])
    @deals = @search.where(:creator_id => current_user.call_centre? ? current_user.subaccounts.map(&:id) : current_user.id).paginate(:page => params[:page])
  end

  def edit

  end

  def update
    @deal.update_attributes(params[:deal]) ? success(t("flash.deals.update.notice")) : render(:edit)
  end

  private

  def set_deal
    @deal = Deal.find(params[:id])
  end

  def prepare_assets
    @logo = @deal.build_logo unless @deal.logo
    @images = @deal.images
    @materials = @deal.materials
    @image = Asset::DealImage.new
    @material = Asset::DealMaterial.new
  end
end