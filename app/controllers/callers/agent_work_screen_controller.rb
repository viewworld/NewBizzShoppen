class Callers::AgentWorkScreenController < Callers::CallerController

  before_filter :set_campaign
  before_filter :set_agent
  before_filter :set_contacts
  before_filter :set_pending_contacts
  before_filter :set_contact
  before_filter :set_contact_managing

  def index
    authorize_manage_rights(@campaign)
    set_locals
    redirect_to callers_campaign_agent_work_screen_index_path(Campaign.find(params[:change_campaign_id])) if params[:change_campaign_id]
  end



  private
  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def set_agent
    @agent = current_user
    @campaign.assign_contacts_to_agent(@agent)
  end

  def set_contacts
    @contacts = @agent.contacts.for_campaign(@campaign).with_pending_status(false)
  end

  def set_pending_contacts
    @pending_contacts = @agent.contacts.for_campaign(@campaign).with_pending_status(true)
  end

  def set_contact
    @lead = @contact = @contacts.first
  end

  def set_locals
   @locals = {:campaign => @campaign,
              :agent => @agent,
              :contact => @contact,
              :contacts => @contacts,
              :pending_contacts => @pending_contacts,
              :namespace => "callers" }
  end

  def set_contact_managing
    @contact_managing = true
  end

end
