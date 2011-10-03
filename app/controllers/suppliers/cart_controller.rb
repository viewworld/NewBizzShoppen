class Suppliers::CartController < Suppliers::SupplierController
  before_filter :get_cart

  def show
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