class Callers::MyResultsController < Callers::CallerController
  inherit_resources
  set_tab "campaigns"

  def update
    @contact = current_user.all_contacts_with_results.find(params[:id], :readonly => false)

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to callers_campaign_my_results_path(@contact.campaign) }
      else
        format.html { render("edit") }
      end
    end
  end

  protected
  def collection
    params[:search]||={}
    @search = Contact.scoped_search(params[:search])
    @search.with_results = true
    if current_user.has_role?(:call_centre)
      @search.with_agents = (params[:search][:with_agents].to_a.map(&:to_i) & current_user.subaccounts.map(&:id)).map(&:to_s)
    elsif current_user.has_any_role?(:agent, :call_centre_agent)
      @search.with_agents = current_user.id
    end
    if @campaign = Campaign.find_by_id(params[:campaign_id])
      @agents = @campaign.users.with_agents_without_call_centres
      @search.for_campaigns = @campaign.id
    elsif current_user.has_role?(:admin)
      @agents = User.assigned_to_campaigns.with_results.with_agents_without_call_centres
    else
      @search.for_campaigns = Campaign.available_for_user(current_user).map(&:id)
      @agents = User.assigned_to_campaigns.with_results.for_campaigns(@search.for_campaigns).with_agents_without_call_centres.where("parent_id = ?", current_user.id)
    end
    @contacts = @search.select("DISTINCT(leads.id), leads.*").order("leads.last_call_result_at DESC").paginate(:page => params[:page], :per_page => 20)
  end

  def resource
    @contact = current_user.all_contacts_with_results.find(params[:id])
  end
end