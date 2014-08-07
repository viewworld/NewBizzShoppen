class Suppliers::NotInvoicedLeadsController < Suppliers::AdvancedSupplierController
  inherit_resources

  set_tab "not_invoiced_leads"

  before_filter :authorize_for_big_buyer

  protected

  def collection
    params[:search]||={}
    params[:search][:with_not_invoiced_for_user] = current_user.id
    params[:search][:with_leads] = true
    @search = LeadPurchase.scoped_search(params[:search])
    @lead_purchases = @search.all
  end
end
