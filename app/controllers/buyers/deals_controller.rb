class Buyers::DealsController < Buyers::BuyerController
  before_filter :set_deal, :only => [:edit, :update, :destroy]
  before_filter :prepare_assets, :only => [:edit, :update]

  def new
    @deal = Deal.new(
        :company_name => current_user.company_name,
        :contact_name => current_user.full_name,
        :email_address => current_user.email,
        :phone_number => current_user.phone,
        :address_line_1 => current_user.with_role.address.address_line_1,
        :address_line_2 => current_user.with_role.address.address_line_2,
        :address_line_3 => current_user.with_role.address.address_line_3,
        :zip_code => current_user.with_role.address.zip_code,
        :country_id => current_user.with_role.address.country_id,
        :region_id => current_user.with_role.address.region_id,
        :start_date => Date.today,
        :end_date => Date.today,
        :price => 0
    )
  end

  def create
    @deal = current_user.deals.build(params[:deal])
    if @deal.save
      @deal.reload
      @deal.deal_template_ids = params[:deal][:deal_template_ids]
      @deal.save
      success("Deal has been successfully created.")
    else
      render(:new)
    end
  end

  def edit

  end

  def update
    @deal.update_attributes(params[:deal]) ? success("Deal has been successfully updated.") : render(:edit)
  end

  def destroy
    @deal.destroy
    success("Deal has been successfully destroyed.")
  end

  def index
    @search = Deal.scoped_search(params[:search])
    @deals = @search.where(:creator_id => current_user.id).paginate(:page => params[:page])
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

  def success(message)
    flash[:notice] = message
    redirect_to buyers_deals_path
  end

end