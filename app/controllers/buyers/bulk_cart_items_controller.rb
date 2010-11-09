class Buyers::BulkCartItemsController < Buyers::BuyerController

  def create
    flash[:notice] = if params[:lead_ids]
                       t("buyer.bulk_cart_items.create.flash.n_cart_items_added", :count => (current_user.cart.add_leads(params[:lead_ids])).size)
                     else
                       t("buyer.bulk_cart_items.create.flash.no_cart_items_added")
                     end
    redirect_to :back
  end

end