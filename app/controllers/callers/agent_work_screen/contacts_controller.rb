class Callers::AgentWorkScreen::ContactsController < Callers::AgentWorkScreenController

  before_filter :set_contact

  def destroy
    params[:deassign] ? @contact.assign_agent(nil) : @contact.destroy
    @contact_old = @contact
    set_contacts
    set_contact
    set_locals
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    attrs = {:creator => @agent, :creator_name => @agent.full_name, :campaign_id => @campaign.id, :category_id => @campaign.category_id}
    @contact = Contact.new(params[:contact])
    @contact.attributes = attrs
    if @contact.save
      @contact.assign_agent(@agent)
    end
    set_locals
  end

  def update
    @contact.update_attributes params[:contact]
    set_locals
  end

  def show
    if request.xhr?
      @fast = params[:fast] == "true"
      set_locals
      unless @fast
        add_completed_to_locals
        add_pending_to_locals
      end
    else
      redirect_to callers_campaign_agent_work_screen_index_path(params[:campaign_id], :selected_contact_id => params[:id])
    end
  end

  def contacts_for_search
    @contacts = @campaign.contacts.where("lower(company_name) LIKE ?", "%#{params[:term].downcase}%").limit(10).order(:company_name)
    respond_to do |format|
      format.js
    end
  end

  private
  def set_contact
    @lead = @contact = @campaign.contacts.find_by_id(params[:id]) || @contacts.first
    set_agent
  end

end