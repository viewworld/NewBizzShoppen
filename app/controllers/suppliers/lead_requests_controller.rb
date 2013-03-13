class Suppliers::LeadRequestsController < Suppliers::AdvancedSupplierController
  inherit_resources

  set_tab "requested_leads"

  before_filter :authorize_for_team_buyers

  protected

  def begin_of_association_chain
    current_user
  end

  def collection
    params[:search]||={}
    params[:search][:with_owner] = current_user.id
    params[:search][:with_leads] = "1"
    @countries = Country.with_lead_request_owner(current_user).map{|c| [c.name.to_s, c.id]}.sort
    @categories = LeadCategory.with_lead_request_owner(current_user).map{|c| [c.name.to_s, c.id]}.sort
    @requestees = User.requestees_for_lead_request_owner(current_user).uniq.map{|r| [r.full_name, r.id]}.sort
    @search = LeadRequest.scoped_search(params[:search])
    @lead_requests = @search.all
  end

  public

  def destroy
    resource.reject!
    flash[:notice] = t("supplier.lead_requests.index.flash.lead_request_rejected_successfully")
    redirect_to :back
  end

  def update
    resource.accept!
    flash[:notice] = t("supplier.lead_requests.index.flash.lead_request_accepted_successfully")
    redirect_to :back
  end
end
