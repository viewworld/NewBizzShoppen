class CallCentres::LeadsController < CallCentres::CallCentreController
  inherit_resources
  actions :all, :except => [:create,:new]

  set_tab "leads"

  protected

  def collection
    params[:search]||={}
    params[:search][:with_call_centre] = current_user.id

    @search = Lead.scoped_search(params[:search])
    @leads = @search.paginate(:page => params[:page], :per_page => Lead.per_page)
    @call_centre_agents = User.with_lead_creators_for(current_user).map{ |u| [u.full_name, u.id] }
  end
end