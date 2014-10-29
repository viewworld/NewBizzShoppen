class Administration::Invoicing::SellersController < Administration::AdministrationController
  def update
    @seller = Seller.find(params[:seller_id])

    respond_to do |format|
      format.js
      format.html
    end
  end
end
