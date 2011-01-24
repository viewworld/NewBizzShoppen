class CallCentres::LeadsController < CallCentres::CallCentreController
  inherit_resources
  actions :all, :except => [:create,:new]

  set_tab "leads"

  def update
    @lead = Lead.find(params[:id])
    @lead.current_user = current_user

    update! do |success, failure|
      success.html { redirect_to call_centres_leads_path }
      success.js { render :nothing => true }
    end
  end

  def destroy
    @lead = Lead.find(params[:id])
    if @lead.destroy
      flash[:notice] = I18n.t("call_centre.leads.destroy.flash.lead_deletion_successful")
    else
      flash[:notice] = I18n.t("call_centre.leads.destroy.flash.lead_deletion_failure")
    end
    redirect_to call_centres_leads_path
  end

  protected

  def collection
    params[:search]||={}
    params[:search][:with_call_centre] = current_user.id

    @search = Lead.scoped_search(params[:search])
    @leads = @search.paginate(:page => params[:page], :per_page => Lead.per_page)
    @call_centre_agents = User.with_lead_creators_for(current_user).map{ |u| [u.full_name, u.id] }
  end
end