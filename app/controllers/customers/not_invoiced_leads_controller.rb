class Customers::NotInvoicedLeadsController < Customers::CustomerController
  inherit_resources

  set_tab "not_invoiced_leads"

  before_filter :authorize_for_big_buyer

  protected

  def collection
    params[:search]||={}
    params[:search][:with_not_invoiced] = "1"
    params[:search][:with_not_invoiced_for_user] = current_user.id
    @search = Lead.scoped_search(params[:search])
    @leads = @search.all
  end

  public

end
