class PurchaseManagers::LeadsController < PurchaseManagers::PurchaseManagerController
  inherit_resources

  set_tab "created_leads"

  protected

  def begin_of_association_chain
    current_user
  end

  def collection
    if current_user
      @categories = current_user.has_accessible_categories? ? Category.with_leads.within_accessible(current_user).without_locked_and_not_published : current_user.has_role?(:customer) ? Category.with_leads.without_locked_and_not_published.with_customer_unique(current_user) : Category.with_leads.without_locked_and_not_published.with_agent_unique(current_user)
    else
      @categories = Category.with_leads.without_locked_and_not_published.without_unique
    end

    params[:search] ||= {}
    @search = Lead.scoped_search(params[:search])
    @search.without_inactive = true if params[:search][:without_inactive].nil?
    @search.without_outdated = true if params[:search][:without_outdated].nil?
    @leads = @search.where(:creator_id => current_user.id).paginate(:page => params[:page], :per_page => Settings.default_leads_per_page)
  end

  def default_params_hash(params={})
    [[:contact_name, current_user.full_name], [:phone_number, current_user.phone], [:email_address, current_user.email],
     [:address_line_1, current_user.address.address_line_1], [:address_line_2, current_user.address.address_line_2],
     [:zip_code, current_user.address.zip_code], [:address_line_3, current_user.address.address_line_3]].each do |field|
        params[field.first] = field.last if params[field.first].blank?
    end

    params.merge({
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
    session[:selected_category] = @lead.category_id

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
