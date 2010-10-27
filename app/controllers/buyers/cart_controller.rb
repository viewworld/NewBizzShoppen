class Buyers::CartController < Buyers::BuyerController
  before_filter :get_cart

  def show
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