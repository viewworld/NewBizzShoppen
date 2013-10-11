class Callers::AgentWorkScreenController < Callers::CallerController

  before_filter lambda {authorize_role(:call_centre, :call_centre_agent, :agent, :admin)}
  before_filter :set_campaign
  before_filter :set_agent
  before_filter :set_contacts
  before_filter :set_contact
  before_filter :set_contact_managing
  before_filter :set_currency

  def index
    authorize_manage_rights(@contact) if @contact
    set_locals
    @selected_call_result = params[:selected_call_result_id].blank? ? nil : CallResult.where(:creator_id => current_user.call_centre? ? current_user.subaccount_ids : current_user.id).find_by_id(params[:selected_call_result_id])
    @selected_contact = params[:selected_contact_id].blank? ? nil : @campaign.contacts.find(params[:selected_contact_id])
    redirect_to callers_campaign_agent_work_screen_index_path(Campaign.find(params[:change_campaign_id])) if params[:change_campaign_id]

    @search_contacts = @campaign.contacts.where("company_name ILIKE :q OR company_phone_number ILIKE :q", :q => "%#{params[:term]}%").limit(100).order(:company_name)
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def set_currency
    @currency = @campaign.currency
  end

  def set_agent
    if (current_user.call_centre? or current_user.admin?) and (other_user_id = params[:other_user_id] || session[:other_user_id]) and other_user_id.to_i != current_user.id
      @agent = current_user.admin? ? User.find_by_id(other_user_id).with_role : current_user.subaccounts.find_by_id(other_user_id)
      raise CanCan::AccessDenied unless @agent
      @agent = @agent.with_role
      session[:other_user_id] = other_user_id if params[:other_user_id]
    elsif current_user.admin? and (!params[:other_user_id] and !session[:other_user_id])
      raise CanCan::AccessDenied
    else
      session[:other_user_id] = nil
      @agent = current_user
      @campaign.assign_contacts_to_agent(@agent)
    end
  end

  def set_contacts
    @contacts = if @campaign.shared_contact_pool?
                  [@campaign.assinged_contact_from_shared_pool(@agent)]
                else
                  @agent.contacts.for_campaign(@campaign).with_pending_status(false)
                end
  end

  def set_pending_contacts
    @pending_contacts = @agent.contacts.for_campaign(@campaign).with_pending_status(true).with_pending_result_type.reorder("result_values.value ASC")
  end

  def set_completed_contacts
    @completed_contacts = @campaign.contacts.with_completed_status(true).joins("RIGHT JOIN (SELECT contact_id, MAX(created_at) FROM call_results 	WHERE creator_type = '#{@agent.with_role.class.to_s}' and creator_id = #{@agent.id} GROUP BY contact_id) cs ON cs.contact_id = leads.id")
  end

  def set_contact
    @lead = @contact = @contacts.first
  end

  def set_locals
   @locals = {:campaign => @campaign,
              :agent => @agent,
              :contact => @contact,
              :contacts => @contacts,
              :namespace => "callers" }
  end

  def add_pending_to_locals
   set_pending_contacts
   @locals[:pending_contacts] = @pending_contacts
  end

  def add_completed_to_locals
    if params[:empty_table]
      @locals[:completed_contacts] = []
    else
      set_completed_contacts
      @locals[:completed_contacts] = @completed_contacts
    end
  end

  def set_contact_managing
    @contact_managing = true
  end

end