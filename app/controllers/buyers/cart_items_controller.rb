class Buyers::CartItemsController <  Buyers::BuyerController

  def create
    current_user.cart.add_lead(Lead.find_by_id(params[:id]))
    flash[:notice] = t("buyer.cart_items.create.flash.cart_item_creation_successful")
    redirect_to :back
  end

  def destroy
    current_user.cart.remove_lead(params[:id])
    flash[:notice] = t("buyer.cart_items.destroy.flash.cart_item_destruction_successful")
    redirect_to :back
  end
end