class LeadUsers::LeadRequestsController < LeadUsers::LeadUserController
  inherit_resources

  set_tab "my_requested_leads"

  protected

  def begin_of_association_chain
    current_user
  end

  def collection
    params[:search]||={}
    params[:search][:with_requested_by] = current_user.id
    params[:search][:with_leads] = "1"
    @lead_requests = LeadRequest.with_requested_by(current_user.id)
    @countries = Country.with_lead_request_requested_by(current_user).map{|c| [c.name, c.id]}.sort
    @categories = LeadCategory.with_lead_request_requested_by(current_user).map{|c| [c.name, c.id]}.sort
    @search = LeadRequest.scoped_search(params[:search])
    @lead_requests = @search.order("created_at DESC").all
  end

  def build_resource
    @lead_request = current_user.lead_requests.build(:lead_id => params[:lead_id])
  end

  public

  def create
    create! do |success, _|
      success.html { redirect_to lead_users_lead_requests_path }
    end
  end
end
