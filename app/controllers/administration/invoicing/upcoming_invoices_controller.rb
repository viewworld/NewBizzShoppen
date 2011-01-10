class Administration::Invoicing::UpcomingInvoicesController < Administration::AdministrationController

  set_tab "upcoming_invoices"

  def index
    @lead_purchases = LeadPurchase.with_not_invoiced.paginate :page => params[:page], :per_page => 20
  end

end