class CallCentreAgents::LeadsController < CallCentreAgents::CallCentreAgentController
  inherit_resources

  set_tab "leads"

  def new
    @lead = Lead.new(:current_user => current_user, :currency => Currency.default_currency, :country => Country.get_country_from_locale)
    @lead.category_id = params[:category_id]
    @lead.duplicate_fields(current_user.leads.find_by_id(params[:lead_id]))
    @lead.published = current_user.can_publish_leads?
  end

  def create
    @lead = current_user.leads.build(params[:lead])
    @lead.published = params[:lead][:published] if current_user.can_publish_leads?
    @lead.current_user = current_user
    session[:selected_category] = @lead.category_id
    @lead.validate_contact_email = true if params[:commit_certify] and @lead.email_address.blank?

    create! do |success, failure|
      success.html {
        if !params[:commit_certify].blank?
          @lead.lead_certification_requests.create
        end
        if !params[:commit_duplicate].blank?
          redirect_to new_call_centre_agents_lead_path(:lead_id => @lead.id, :category_id => @lead.category_id)
        elsif !params[:commit_continue].blank?
          redirect_to new_call_centre_agents_lead_path(:category_id => @lead.category_id)
        else
          redirect_to call_centre_agents_leads_path
        end
      }
      end
  end

  def show
    @lead = current_user.leads.find(params[:id])
  end

  def update
    @lead = current_user.leads.find(params[:id])
    @lead.current_user = current_user

    update! do |success, failure|
      success.html { redirect_to call_centre_agents_leads_path }
      success.js { render :nothing => true }
    end
  end

  def destroy
    @lead = current_user.leads.find(params[:id])
    if @lead.destroy
      flash[:notice] = I18n.t("call_centre_agent.leads.destroy.flash.lead_deletion_successful")
    else
      flash[:notice] = I18n.t("call_centre_agent.leads.destroy.flash.lead_deletion_failure")
    end
    redirect_to call_centre_agents_leads_path
  end

  protected

  def collection
    if current_user
      @categories = current_user.has_accessible_categories? ? Category.with_leads.within_accessible(current_user).without_locked_and_not_published : current_user.has_role?(:customer) ? Category.with_leads.without_locked_and_not_published.with_customer_unique(current_user) : Category.with_leads.without_locked_and_not_published.with_agent_unique(current_user)
    else
      @categories = Category.with_leads.without_locked_and_not_published.without_unique
    end

    params[:search]||={}

    @search = Lead.scoped_search(params[:search])
    @search.without_inactive = true if params[:search][:without_inactive].nil?
    @search.without_outdated = true if params[:search][:without_outdated].nil?
    @leads = @search.where(:creator_id => current_user.id).order("id DESC").paginate(:page => params[:page], :per_page => Settings.default_leads_per_page)
  end

end