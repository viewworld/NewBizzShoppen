class Administration::Invoicing::RefundsController < Administration::SuperadminController
  set_tab 'reports'
  set_subtab 'refunds'

  def index
    @search = CreditNote.scoped_search(params[:search])
    @search.with_type = 'refund'
    @credit_notes = @search.paginate(page: params[:page], per_page: 20)
  end
end
