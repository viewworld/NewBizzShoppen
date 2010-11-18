class LeadUsers::LeadRequestsController < LeadUsers::LeadUserController
  inherit_resources

  protected

  def begin_of_association_chain
    current_user
  end

  def collection
    params[:search]||={}
    params[:search][:with_requested_by] = current_user.id
    params[:search][:with_leads] = "1"
    @lead_requests = LeadRequest.with_requested_by(current_user.id)
    @countries = @lead_requests.map(&:country).uniq.map{|c| [c.name, c.id]}
    @categories = @lead_requests.map(&:category).uniq.map{|c| [c.name, c.id]}
    @requestees = @lead_requests.map(&:requestee).uniq.map{|r| [r.full_name, r.id]}
    @search = LeadRequest.scoped_search(params[:search])
    @lead_requests = @search.all
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
