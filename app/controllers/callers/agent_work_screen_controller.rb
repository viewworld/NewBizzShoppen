class Callers::AgentWorkScreenController < Callers::CallerController

  before_filter lambda {authorize_role(:call_centre, :call_centre_agent, :agent)}
  before_filter :set_campaign
  before_filter :set_agent
  before_filter :set_contacts
  before_filter :set_pending_contacts
  before_filter :set_completed_contacts
  before_filter :set_contact
  before_filter :set_contact_managing

  def index
    authorize_manage_rights(@contact) if @contact 
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

  # TODO REFACTOR! it takes over 1s
  def set_completed_contacts
    #@completed_contacts = @campaign.contacts.with_completed_status(true).select{ |contact| contact.current_call_result.creator == current_user.with_role }
    @completed_contacts = @campaign.contacts.with_completed_status(true).joins("RIGHT JOIN (SELECT contact_id, MAX(created_at) FROM call_results 	WHERE creator_type = '#{current_user.with_role.class.to_s}' and creator_id = #{current_user.id} GROUP BY contact_id) cs ON cs.contact_id = leads.id")
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
              :completed_contacts => @completed_contacts,
              :namespace => "callers" }
  end

  def set_contact_managing
    @contact_managing = true
  end

end
