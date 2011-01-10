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
    @lead = Lead.new(:current_user => current_user)
    @lead.published = current_user.can_publish_leads?
  end

  def create
    @lead = current_user.leads.build(params[:lead])
    @lead.current_user = current_user

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

  def show
    @lead = current_user.leads.find(params[:id])
  end

  def update
    @lead = Lead.find(params[:id])
    @lead.current_user = current_user

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
