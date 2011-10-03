class Suppliers::BulkCartItemsController < Suppliers::SupplierController

  def create
    flash[:notice] = if params[:lead_ids]
                      if current_user.big_buyer?
                        t("supplier.bulk_cart_items.create.flash.n_leads_bought", :count => (current_user.cart.add_leads(params[:lead_ids])).size)
                      else
                       t("supplier.bulk_cart_items.create.flash.n_cart_items_added", :count => (current_user.cart.add_leads(params[:lead_ids])).size)
                      end
                     else
                       t("supplier.bulk_cart_items.create.flash.no_cart_items_added")
                     end

    if lead_supplier = User::LeadSupplier.find_by_id(current_user.id) and lead_supplier.accessible_lead_purchases.empty? and !current_user.big_buyer? and
       !lead_supplier.leads_in_cart.empty? and session[:show_cart_hint].to_i == 0
      session[:show_cart_hint] = "1"
    end

    redirect_to :back
  end

end