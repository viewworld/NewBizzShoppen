class Administration::SellersController < Administration::AdministrationController
  include Controllers::CommonActions

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

    common_save(@seller, success: { redirect: administration_sellers_path })
  end

  def update
    @seller.assign_attributes(seller_params)

    common_save(@seller, success: { redirect: administration_sellers_path })
  end

  def destroy
    common_destroy(@seller, success: { redirect: administration_sellers_path })
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
