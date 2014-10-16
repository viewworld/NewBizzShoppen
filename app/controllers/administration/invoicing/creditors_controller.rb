class Administration::Invoicing::CreditorsController < Administration::SuperadminController
  set_tab "reports"
  set_subtab "creditors"

  def index
    @search = CreditNote.scoped_search(params[:search])
    @search.with_type = "credit"
    @credit_notes = @search.paginate page: params[:page], per_page: 20
  end
end
