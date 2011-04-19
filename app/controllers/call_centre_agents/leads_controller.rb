class CallCentreAgents::LeadsController < CallCentreAgents::CallCentreAgentController
  inherit_resources

  set_tab "leads"

  def new
    @lead = Lead.new(:current_user => current_user)
    @lead.category_id = params[:category_id]
    @lead.duplicate_fields(current_user.leads.find_by_id(params[:lead_id]))
    @lead.published = current_user.can_publish_leads?
  end

  def create
    @lead = current_user.leads.build(params[:lead])
    @lead.published = params[:lead][:published] if current_user.can_publish_leads?
    @lead.current_user = current_user
    session[:selected_category] = @lead.category_id

    create! do |success, failure|
      success.html {
        if !params[:commit_duplicate].blank?
          redirect_to new_call_centre_agents_lead_path(:lead_id => @lead.id, :category_id => @lead.category_id)
        elsif !params[:commit_continue].blank?
          redirect_to new_call_centre_agents_lead_path(:category_id => @lead.category_id)
        else
          redirect_to call_centre_agents_leads_path
        end
      }
      end
  end

  def show
    @lead = current_user.leads.find(params[:id])
  end

  def update
    @lead = current_user.leads.find(params[:id])
    @lead.current_user = current_user

    update! do |success, failure|
      success.html { redirect_to call_centre_agents_leads_path }
      success.js { render :nothing => true }
    end
  end

  def destroy
    @lead = current_user.leads.find(params[:id])
    if @lead.destroy
      flash[:notice] = I18n.t("call_centre_agent.leads.destroy.flash.lead_deletion_successful")
    else
      flash[:notice] = I18n.t("call_centre_agent.leads.destroy.flash.lead_deletion_failure")
    end
    redirect_to call_centre_agents_leads_path
  end

  protected

  def collection
    params[:search]||={}

    @search = Lead.scoped_search(params[:search])
    @search.without_inactive = true if params[:search][:without_inactive].nil?
    @search.without_outdated = true if params[:search][:without_outdated].nil?
    @leads = @search.where(:creator_id => current_user.id).order("id DESC").paginate(:page => params[:page], :per_page => Settings.default_leads_per_page)
  end

end