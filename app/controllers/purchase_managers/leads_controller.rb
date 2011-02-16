class PurchaseManagers::LeadsController < PurchaseManagers::PurchaseManagerController
  inherit_resources

  set_tab "created_leads"

  protected

  def begin_of_association_chain
    current_user
  end

  def collection
    @search = Lead.scoped_search(params[:search])
    @leads = @search.where(:creator_id => current_user.id).paginate(:page => params[:page], :per_page => Settings.default_leads_per_page)
  end

  def default_params_hash(params={})
    params.merge({
        :contact_name   => current_user.full_name,
        :phone_number   => current_user.phone,
        :email_address  => current_user.email,
        :address_line_1 => current_user.address.address_line_1,
        :city           => current_user.address.address_line_2,
        :zip_code       => current_user.address.zip_code,
        :county         => current_user.address.address_line_3,
        :published      => false,
        :current_user   => current_user    
    })
  end

  public

  def new
    @lead = Lead.new(default_params_hash)
    @lead.category_id = params[:category_id]
    @lead.duplicate_fields(current_user.leads.find_by_id(params[:lead_id]))
  end

  def create
    @lead = current_user.leads.build(default_params_hash(params[:lead]))

    create! do |success, failure|
      success.html {
        if !params[:commit_duplicate].blank?
          redirect_to new_purchase_managers_lead_path(:lead_id => @lead.id, :category_id => @lead.category_id)
        elsif !params[:commit_continue].blank?
          redirect_to new_purchase_managers_lead_path(:category_id => @lead.category_id)
        else
          redirect_to purchase_managers_leads_path
        end
      }
      end
  end

  def show
    @lead = current_user.leads.find(params[:id])
  end

  def update
    update! do |success, failure|
      success.html { redirect_to purchase_managers_leads_path }
      success.js { render :nothing => true }
      failure.html { redirect_to purchase_managers_leads_path }
      failure.js { render :nothing => true }
    end
  end

  def destroy
    @lead = current_user.leads.find(params[:id])
    if @lead.destroy
      flash[:notice] = I18n.t("purchase_manager.leads.destroy.flash.lead_deletion_successful")
    else
      flash[:notice] = I18n.t("purchase_manager.leads.destroy.flash.lead_deletion_failure")
    end
    redirect_to purchase_managers_leads_path
  end
end
