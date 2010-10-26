class Buyers::CartItemsController <  Buyers::BuyerController

  def create
    current_user.cart.add_lead(Lead.find_by_id(params[:id]))
    flash[:notice] = "Added to cart"
    redirect_to :back
  end

  def destroy
    current_user.cart.remove_lead(params[:id])
    flash[:notice] = "Removed from cart"
    redirect_to :back
  end
end