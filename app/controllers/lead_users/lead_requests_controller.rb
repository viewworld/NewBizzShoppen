class LeadUsers::LeadRequestsController < LeadUsers::LeadUserController
  inherit_resources

  protected

  def begin_of_association_chain
    current_user
  end

  def collection
    @lead_requests ||= end_of_association_chain.paginate(:page => params[:page])
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
