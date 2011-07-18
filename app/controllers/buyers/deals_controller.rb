class Buyers::DealsController < Buyers::BuyerController

  def index
    # TODO change to deals for current_user only!
    @search = Lead.scoped_search(params[:search])
    @deals = @search.paginate(:page => params[:page])
  end

end