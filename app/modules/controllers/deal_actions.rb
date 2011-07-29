module DealActions

  def destroy
    @deal.destroy
    success(t("flash.deals.destroy.notice"))
  end

  def index
    params[:search] = {"descend_by_created_at" => "true"} if params[:search].blank?
    @search = Deal.scoped_search(params[:search])
    @deals = current_user.admin? ? @search.paginate(:page => params[:page]) : @search.where(:creator_id => current_user.call_centre? ? current_user.subaccounts.map(&:id) + [current_user.id] : current_user.id).paginate(:page => params[:page])
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

  def check_user
    if current_user and current_user.has_any_role?(:call_centre_agent, :call_centre) and !current_user.has_role?(:deal_maker)
      raise CanCan::AccessDenied
    end
  end
end