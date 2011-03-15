class Administration::Invoicing::CreditorsController < Administration::AdministrationController
  inherit_resources

  set_tab "financial"
  set_subtab "creditors"

  protected

  def collection
    @search = CreditNote.scoped_search(params[:search])
    @credit_notes = @search.all.paginate :page => params[:page], :per_page => 20
  end
end