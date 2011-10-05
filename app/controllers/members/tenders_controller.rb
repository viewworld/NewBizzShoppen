class Members::TendersController < Members::MemberController
  inherit_resources

  before_filter :categories_for_current_user, :only => [:index,:new]

  set_tab "tenders"

  def new
    @lead = Lead.new(:current_user => current_user, :currency => Currency.default_currency, :country => Country.get_country_from_locale)
    @lead.copy_user_profile(current_user)
    @lead.category_id = if params[:category_id]
      params[:category_id]
    elsif @categories.any?
      @categories.first.id
    else
      redirect_to :back
    end
    @lead.duplicate_fields(current_user.leads.find_by_id(params[:lead_id]))
    @lead.published = current_user.can_publish_leads?
  end

  def create
    @lead = current_user.leads.build(params[:lead])
    @lead.published = params[:lead][:published] if current_user.can_publish_leads?
    @lead.current_user = current_user
    session[:selected_category] = @lead.category_id
    @lead.validate_contact_email = true if params[:commit_certify] and @lead.email_address.blank?
    @lead.price = @lead.category.default_price
    @lead.currency = @lead.category.currency
    @tender = @lead

    create! do |success, failure|
      success.html {
        if !params[:commit_certify].blank?
          @lead.lead_certification_requests.create
        end
        if !params[:commit_duplicate].blank?
          redirect_to new_members_tender_path(:lead_id => @lead.id, :category_id => @lead.category_id)
        elsif !params[:commit_continue].blank?
          redirect_to new_members_tender_path(:category_id => @lead.category_id)
        else
          redirect_to members_tenders_path
        end
      }
      end
  end

  def show
    @lead = current_user.leads.find(params[:id])
  end

  def edit
    @lead = current_user.leads.find(params[:id])
  end


  def update
    @lead = current_user.leads.find(params[:id])
    @lead.current_user = current_user
    @tender = @lead
    params[:tender] = params[:lead]

    update! do |success, failure|
      success.html { redirect_to members_tenders_path }
      success.js { render :nothing => true }
    end
  end

  def destroy
    @lead = current_user.leads.find(params[:id])
    if @lead.destroy
      flash[:notice] = I18n.t("member.tenders.destroy.flash.tender_deletion_successful")
    else
      flash[:notice] = I18n.t("member.tenders.destroy.flash.tender_deletion_failure")
    end
    redirect_to members_tenders_path
  end

  protected

  def collection
    params[:search]||={}

    @search = Lead.scoped_search(params[:search])
    @search.without_inactive = true if params[:search][:without_inactive].nil?
    @search.without_outdated = true if params[:search][:without_outdated].nil?
    @leads = @search.order("created_at DESC").where(:creator_id => current_user.id).order("id DESC").paginate(:page => params[:page], :per_page => Settings.default_leads_per_page)
  end

  def categories_for_current_user
    if current_user
      @categories = current_user.has_accessible_categories? ? LeadCategory.with_leads.within_accessible(current_user).without_locked_and_not_published : current_user.has_role?(:supplier) ? LeadCategory.with_leads.without_locked_and_not_published.with_supplier_unique(current_user) : LeadCategory.with_leads.without_locked_and_not_published.with_agent_unique(current_user)
    else
      @categories = LeadCategory.with_leads.without_locked_and_not_published.without_unique
    end
  end

end