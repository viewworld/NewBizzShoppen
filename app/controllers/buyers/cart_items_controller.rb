class Buyers::CartItemsController < Buyers::BuyerController

  def create
    status = if params[:buyout] == "true"
      current_user.cart.buyout_lead(Lead.find_by_id(params[:id]))
    else
      current_user.cart.add_lead(Lead.find_by_id(params[:id]))
    end

    if lead_buyer = User::LeadBuyer.find_by_id(current_user.id) and lead_buyer.accessible_lead_purchases.empty? and !current_user.big_buyer? and
        !lead_buyer.leads_in_cart.empty? and session[:show_cart_hint].to_i == 0
      session[:show_cart_hint] = "1"
    end

    flash[:notice] = t("buyer.cart_items.create.flash.cart_item_#{status.to_s}")
    redirect_to :back
  end

  def destroy
    current_user.cart.remove_leads(params[:id])
    flash[:notice] = t("buyer.cart_items.destroy.flash.cart_item_destruction_successful")
    redirect_to :back
  end
end