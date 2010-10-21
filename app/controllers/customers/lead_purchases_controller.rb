class Customers::LeadPurchasesController < Customers::CustomerController

  def index

  end

  def update
    @customer.update_attributes(params[:user_customer])
    redirect_to customers_lead_purchases_path
  end
end
