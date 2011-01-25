class CallCentreAgents::LeadsController < CallCentreAgents::CallCentreAgentController
  inherit_resources

  set_tab "leads"

  def new
    @lead = Lead.new(:current_user => current_user)
    @lead.published = current_user.can_publish_leads?
  end

  def create
    @lead = current_user.leads.build(params[:lead])
    @lead.published = params[:lead][:published] if current_user.can_publish_leads?

    create! do |success, failure|
      success.html {
        unless params[:commit_continue].blank?
          redirect_to new_call_centre_agents_lead_path
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
    @leads = @search.where(:creator_id => current_user.id).paginate(:page => params[:page], :per_page => Settings.default_leads_per_page)
  end

end