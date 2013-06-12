class Administration::Invoicing::RefundsController < Administration::SuperadminController
  inherit_resources

  set_tab "reports"
  set_subtab "refunds"

  protected

  def collection
    @search = CreditNote.scoped_search(params[:search])
    @search.with_type = "refund"
    @credit_notes = @search.all.paginate :page => params[:page], :per_page => 20
  end
end