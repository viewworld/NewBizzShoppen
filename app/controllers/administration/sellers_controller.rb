class Administration::SellersController < Administration::AdministrationController
  set_tab 'sellers'

  before_filter :set_seller, only: [:edit, :show, :update, :destroy]

  def index
    @sellers = Seller.all
  end

  def new
    @seller = Seller.new
  end

  def create
    @seller = Seller.new(seller_params)

    if @seller.save
      redirect_to administration_sellers_path
    else
      render :new
    end
  end

  def update
    if @seller.update_attributes(seller_params)
      redirect_to administration_sellers_path
    else
      render :edit
    end
  end

  def destroy
    if @seller.destroy
      redirect_to administration_sellers_path
    else
      redirect_to :back
    end
  end

  private

  def set_seller
    @seller = Seller.find(params[:id])
  end

  def seller_params
    params.require(:seller).permit(:company_name, :first_name, :last_name, :bank_account_id, :vat_no, :default, :note,
      address_attributes: [:address_line_1, :address_line_2, :address_line_3, :zip_code, :country_id, :region_id]
    )
  end
end
