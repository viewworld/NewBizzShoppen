class Administration::ArchivedPaypalResponsesController < Administration::AdministrationController

  inherit_resources


  def collection
    @search = ArchivedPaypalResponse.scoped_search(params[:search])
    @archived_paypal_responses = @search.order("created_at DESC").paginate(:page => params[:page], :per_page => 30)
  end

  def resource
    @archived_paypal_response = ArchivedPaypalResponse.find(params[:id])
  end
end
