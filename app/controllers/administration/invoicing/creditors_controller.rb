class Administration::Invoicing::CreditorsController < Administration::SuperadminController
  inherit_resources

  set_tab "reports"
  set_subtab "creditors"

  protected

  def collection
    @search = CreditNote.scoped_search(params[:search])
    @search.with_type = "credit"
    @credit_notes = @search.paginate :page => params[:page], :per_page => 20
  end
end