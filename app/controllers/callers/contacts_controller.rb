class Callers::ContactsController < Callers::CallerController
  inherit_resources
  set_tab "campaigns"
  before_filter :set_campaign
  before_filter :set_contact, :only => [:edit, :update, :destroy]
  before_filter :set_contact_managing
  before_filter :set_import_flag, :only => [:new, :create]

  def new
    @lead = @contact = Contact.new
  end

  def create
    attrs = {:creator => current_user, :creator_name => current_user.full_name, :campaign_id => @campaign.id, :category_id =>  @campaign.category_id}
    if @import
      Contact.create_from_csv(params[:contact][:formatted_rows], attrs.merge(:contact_name => "", :phone_number => "", :email_address => ""))
      redirect_to edit_callers_campaign_path(@campaign)
    else
      @lead = @contact = Contact.new(params[:contact])
      @contact.attributes = attrs
      create! do |success, failure|
        success.html { redirect_to edit_callers_campaign_path(@campaign) }
        failure.html { render 'new' }
      end
    end
  end

  def edit
    set_call_results
  end

  def update
    @contact.attributes = params[:contact]
    update! do |success, failure|
      success.html { redirect_to edit_callers_campaign_contact_path(@campaign, @contact) }
      failure.html { set_call_results; render 'edit' }
    end
  end

  def destroy
    destroy! do |success, failure|
      success.html { redirect_to edit_callers_campaign_path(@campaign) }
      failure.html {}
    end
  end

  def batch_assign
    if params[:contact_ids].blank?
      flash[:notice] = "You have selected no contact."
    else
      Contact.batch_assign(params[:contact_ids], params[:agent_id])
      flash[:notice] = "Assignment has been performed successfully"
    end
    redirect_to edit_callers_campaign_path(@campaign)
  end

  def batch_remove
    if params[:contact_ids].blank?
      flash[:notice] = "You have selected no contact."
    else
      Contact.batch_remove(params[:contact_ids])
      flash[:notice] = "Removal has been performed successfully"
    end
    redirect_to edit_callers_campaign_path(@campaign)
  end

  def bulk_contacts_export_csv
    send_data Contact.to_csv(*@campaign.contacts.map(&:id)), :filename => "contacts.csv"
  end

  protected

  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def set_contact
    @lead = @contact = Contact.find(params[:id])
  end

  def set_call_results
    @call_results = @contact.call_results
  end

  def set_contact_managing
    @contact_managing = true
  end

  def set_import_flag
    @import = params[:type]
  end

end