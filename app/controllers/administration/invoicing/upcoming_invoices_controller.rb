class Administration::Invoicing::UpcomingInvoicesController < Administration::SuperadminController
  inherit_resources

  set_tab "reports"
  set_subtab "upcoming_invoices"

  protected

  def collection
    params[:search] ||= {}
    params[:search][:with_not_invoiced] = "1"
    @search = Debtor.scoped_search(params[:search])
    @lead_purchases = @search.order("currency_id ASC").all
    @total_euro_sum = @lead_purchases.inject(0.0){ |result, lead_purchase| lead_purchase.not_invoiced_euro_sum.to_f + result}
    @lead_purchases_count = @lead_purchases.count
  end

end