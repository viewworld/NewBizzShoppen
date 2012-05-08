class Suppliers::CartController < Suppliers::BasicSupplierController
  before_filter :get_cart

  def show
    @payment_type = params[:payment_type].to_i > 0 ? params[:payment_type].to_i : @cart.payment_type

    @cart.lead_purchases.select{ |lp| lp.payment_type != @payment_type }.each { |lp| lp.update_attribute(:payment_type, @payment_type) }
  end

  def update
    session[:show_cart_hint] = "2" if params[:show_cart_hint] == "0"
  end

  def destroy
    @cart.empty!
    redirect_to :back
  end

  private

  def get_cart
    @cart = current_user.cart
  end

end