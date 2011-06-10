class Callers::AgentWorkScreen::MyResultsController < Callers::AgentWorkScreenController
  inherit_resources

  def update
    @contact = current_user.all_contacts_with_results.find(params[:id], :readonly => false)

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to callers_campaign_agent_work_screen_my_results_path(@contact.campaign) }
      else
        format.html { render("new") }
      end
    end
  end

  protected
  def collection
    params[:search]||={}
    @search = Contact.scoped_search(params[:search])
    @search.with_results = true
    @search.with_agent = current_user.id
    @search.for_campaign = Campaign.find_by_id(params[:campaign_id])
    @contacts = @search.select("DISTINCT(leads.id), leads.*").order("leads.last_call_result_at DESC").paginate(:page => params[:page], :per_page => 20)
  end

  def resource
    @contact = current_user.all_contacts_with_results.find(params[:id])
  end
end