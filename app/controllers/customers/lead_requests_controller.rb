class Customers::LeadRequestsController < Customers::CustomerController
  inherit_resources

  set_tab "requested_leads"
  protected

  def begin_of_association_chain
    current_user
  end

  def collection
    params[:search]||={}
    params[:search][:with_leads] = "1"
    @lead_requests = LeadRequest.scoped_search.all
    @countries = @lead_requests.map(&:country).uniq.map{|c| [c.name, c.id]}
    @categories = @lead_requests.map(&:category).uniq.map{|c| [c.name, c.id]}
    @requestees = @lead_requests.map(&:requestee).uniq.map{|r| [r.full_name, r.id]}
    @search = LeadRequest.scoped_search(params[:search])
    @lead_requests = @search.all
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
