class Agents::LeadsController < Agents::AgentController
  inherit_resources

  set_tab "created_leads"

  protected

  def begin_of_association_chain
    current_user
  end

  def collection
    @search = Lead.scoped_search(params[:search])
    @leads = @search.where(:creator_id => current_user.id).paginate(:page => params[:page], :per_page => Settings.default_leads_per_page)
  end

  public

  def new
    @lead = Lead.new(:published => true)
  end

  def create
    @lead = current_user.leads.build(params[:lead])

    create! do |success, failure|
      success.html {
        unless params[:commit_continue].blank?
          redirect_to new_agents_lead_path
        else
          redirect_to agents_leads_path
        end
      }
      end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to agents_leads_path }
      success.js { render :nothing => true }
    end
  end

  def destroy
    @lead = current_user.leads.find(params[:id])
    if @lead.destroy
      flash[:notice] = I18n.t("agent.leads.destroy.flash.lead_deletion_successful")
    else
      flash[:notice] = I18n.t("agent.leads.destroy.flash.lead_deletion_failure")
    end
    redirect_to agents_leads_path
  end
end
