class Administration::Invoicing::UpcomingInvoicesController < Administration::AdministrationController
  inherit_resources

  set_tab "financial"
  set_subtab "upcoming_invoices"

  protected

  def collection
    params[:search] ||= {}
    params[:search][:with_not_invoiced] = "1"
    @search = LeadPurchase.scoped_search(params[:search])
    @lead_purchases = @search.order("leads.currency_id ASC").paginate :page => params[:page], :per_page => 20
    @lead_purchases_count = LeadPurchase.with_not_invoiced.count.size
  end

end