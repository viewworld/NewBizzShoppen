class Administration::Invoicing::SellersController < Administration::AdministrationController
  def update
    @seller = Seller.find(params[:seller_id])
  end
end
