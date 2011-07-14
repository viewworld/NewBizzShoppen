class Callers::ContactsController < Callers::CallerController
  inherit_resources
  set_tab "campaigns"
  before_filter :set_campaign
  before_filter :set_contact, :only => [:edit, :update, :destroy]
  before_filter :set_contact_managing
  before_filter :set_import_flag, :only => [:new, :create]
  before_filter lambda { authorize_role(:call_centre, :admin) }
  before_filter lambda { authorize_manage_rights(@contact) }, :only => [:edit, :update, :destroy]

  def new
    @lead = @contact = Contact.new
  end

  def create
    attrs = {:creator => current_user, :creator_name => current_user.full_name, :campaign_id => @campaign.id, :category_id => @campaign.category_id}
    if @import
      contacts = Contact.create_from_csv(params[:contact][:formatted_rows], attrs.merge(:contact_name => "", :phone_number => "", :email_address => ""))
      redirect_to edit_callers_campaign_path(@campaign), :notice => t('contacts.create.flash.successfully_imported', :count => contacts.count)
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
      flash[:notice] = t('contacts.batch_assign.flash.no_contacts_selected')
    elsif @campaign.max_contact_number.to_i.eql?(0)
      flash[:notice] = t('contacts.batch_assign.flash.max_contact_number_is_zero')
    else
      Contact.batch_assign(params[:contact_ids], params[:agent_id])
      flash[:notice] = t('contacts.batch_assign.flash.assigned_successfully')
    end
    redirect_to edit_callers_campaign_path(@campaign)
  end

  def batch_remove
    if params[:contact_ids].blank?
      flash[:notice] = t('contacts.batch_remove.flash.no_contacts_selected')
    else
      Contact.batch_remove(params[:contact_ids])
      flash[:notice] = t('contacts.batch_remove.flash.removed_successfully')
    end
    redirect_to edit_callers_campaign_path(@campaign)
  end

  def bulk_contacts_export_csv
    send_data Contact.to_csv(*@campaign.contacts.map(&:id)), :filename => "contacts.csv"
  end

  def import_xls
    if Sheet.file_validation(params["attachment"].original_filename)
      @campaign.create_contacts_from_xls(Sheet.new(params["attachment"]).roo_instance, current_user)
    else
      flash[:notice] = t('contacts.import_xls.flash.unknown_format')
    end
    redirect_to edit_callers_campaign_path(@campaign)
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