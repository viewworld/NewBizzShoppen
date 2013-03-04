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
    if current_user
      @categories = current_user.has_accessible_categories? ? LeadCategory.with_leads.within_accessible(current_user).without_locked_and_not_published : current_user.has_role?(:supplier) ? LeadCategory.with_leads.without_locked_and_not_published.with_supplier_unique(current_user) : LeadCategory.with_leads.without_locked_and_not_published.with_agent_unique(current_user)
    else
      @categories = LeadCategory.with_leads.without_locked_and_not_published.without_unique
    end

    params[:search]||={}
    params[:search][:with_call_centre] = current_user.id

    @search = Lead.scoped_search(params[:search])
    @search.without_inactive = true if params[:search][:without_inactive].nil?
    @search.without_outdated = true if params[:search][:without_outdated].nil?
    @leads = @search.order("created_at DESC").paginate(:page => params[:page], :per_page => Lead.per_page)
    @call_centre_agents = User.with_lead_creators_for(current_user).map{ |u| [u.full_name, u.id] }.sort
  end
end