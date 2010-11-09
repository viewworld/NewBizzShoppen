class Buyers::CartItemsController < Buyers::BuyerController

  def create
    flash[:notice] =  if current_user.cart.add_lead(Lead.find_by_id(params[:id])) === true
                        t("buyer.cart_items.create.flash.cart_item_bought_successful")
                      else
                        t("buyer.cart_items.create.flash.cart_item_creation_successful")
                      end
    redirect_to :back
  end

  def destroy
    current_user.cart.remove_leads(params[:id])
    flash[:notice] = t("buyer.cart_items.destroy.flash.cart_item_destruction_successful")
    redirect_to :back
  end
end