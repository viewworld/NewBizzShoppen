class Callers::AgentWorkScreen::ContactsController < Callers::AgentWorkScreenController

  before_filter :set_contact  

  def destroy
    params[:deassign] ? @contact.assign_agent(nil) : @contact.destroy
    @contact_old = @contact
    set_contacts
    set_contact
    set_locals
  end

  def update
    @contact.update_attributes params[:contact]
    set_locals
  end

  def show
    set_locals
  end

  private
  def set_contact
    @lead = @contact = @campaign.contacts.find_by_id(params[:id]) || @contacts.first
  end  

end
