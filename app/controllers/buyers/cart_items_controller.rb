class Buyers::CartItemsController < Buyers::BuyerController

  def create
    flash[:notice] = case current_user.cart.add_lead(Lead.find_by_id(params[:id]))
                       when :bought_successful
                         t("buyer.cart_items.create.flash.cart_item_bought_successful")
                       when :creation_successful
                         t("buyer.cart_items.create.flash.cart_item_creation_successful")
                       when :already_in_cart
                         t("buyer.cart_items.create.flash.cart_item_already_in_basket")
                       when :currencies_mismatch
                         t("buyer.cart_items.create.flash.cart_item_currencies_mismatch")
                     end
    redirect_to :back
  end

  def destroy
    current_user.cart.remove_leads(params[:id])
    flash[:notice] = t("buyer.cart_items.destroy.flash.cart_item_destruction_successful")
    redirect_to :back
  end
end