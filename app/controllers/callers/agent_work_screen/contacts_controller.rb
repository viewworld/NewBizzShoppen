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
    attrs = {:creator => current_user, :creator_name => current_user.full_name, :campaign_id => @campaign.id, :category_id => @campaign.category_id}
    @contact = Contact.new(params[:contact])
    @contact.attributes = attrs
    if @contact.save
      @contact.assign_agent(current_user)
    end
    set_locals
  end

  def update
    @contact.update_attributes params[:contact]
    set_locals
  end

  def show
    @fast = params[:fast] == "true"
    set_locals
    unless @fast
      add_completed_to_locals
      add_pending_to_locals
    end
  end

  private
  def set_contact
    @lead = @contact = @campaign.contacts.find_by_id(params[:id]) || @contacts.first
  end

end