class Customers::LeadRequestsController < Customers::CustomerController
  inherit_resources

  set_tab "requested_leads"
  protected

  def begin_of_association_chain
    current_user
  end

  def collection
    @lead_requests ||= end_of_association_chain.paginate(:page => params[:page])
  end

  public

  def destroy
    resource.reject!
    flash[:notice] = t("customer.lead_requests.index.flash.lead_request_rejected_successfully")
    redirect_to :back
  end

  def update
    resource.accept!
    flash[:notice] = t("customer.lead_requests.index.flash.lead_request_accepted_successfully")
    redirect_to :back
  end
end
