class Administration::SellersController < Administration::AdministrationController
  set_tab "sellers"

  before_filter :set_seller, only: [:edit, :show, :update, :destroy]

  def index
    @sellers = Seller.all
  end

  def new
    @seller = Seller.new
  end

  def create
    @seller = Seller.new(params[:seller])

    if @seller.save
      redirect_to administration_sellers_path
    else
      render :new
    end
  end

  def update
    if @seller.update_attributes
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
end
