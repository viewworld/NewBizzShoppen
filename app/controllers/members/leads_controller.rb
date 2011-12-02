class Members::LeadsController < Members::MemberController
  inherit_resources

  set_tab "created_leads"

  before_filter :check_if_deal_is_already_requested, :only => [:new, :create]

  protected

  def begin_of_association_chain
    current_user
  end

  def collection
    if current_user
      @categories = current_user.has_accessible_categories? ? LeadCategory.with_leads.within_accessible(current_user).without_locked : current_user.has_role?(:supplier) ? LeadCategory.with_leads.without_locked.with_supplier_unique(current_user) : LeadCategory.with_leads.without_locked.with_agent_unique(current_user)
    else
      @categories = LeadCategory.with_leads.without_locked_and_not_published.without_unique
    end

    params[:search] ||= {}
    @search = Lead.scoped_search(params[:search])
    @leads = @search.order("created_at DESC").where(:requested_by => current_user.id).paginate(:page => params[:page], :per_page => Settings.default_leads_per_page)
  end

  def default_params_hash(params={})
    [[:contact_name, current_user.full_name], [:phone_number, current_user.phone], [:email_address, current_user.email],
     [:address_line_1, current_user.address.address_line_1], [:address_line_2, current_user.address.address_line_2],
     [:zip_code, current_user.address.zip_code], [:address_line_3, current_user.address.address_line_3],
     [:currency_id, Currency.default_currency.present? ? Currency.default_currency.id : nil], [:country, Country.get_country_from_locale]].each do |field|
        params[field.first] = field.last if params[field.first].blank?
    end

    params.merge({
        :published      => false,
        :current_user   => current_user
    })
  end

  def check_if_deal_is_already_requested
    if (@deal = Deal.find_by_id(params[:deal_id]) and @deal.requested_by?(current_user)) or current_user.active_subscription.is_free?
      redirect_to deal_path(:id => @deal.slug)
    end
  end

  public

  def new
    @deal = Deal.find_by_id(params[:deal_id])
    @lead = Lead.new(params[:lead])
    @lead.based_on_deal(@deal, current_user)
  end

  def create
    @deal = Deal.find_by_id(params[:deal_id])
    @lead = Lead.new(params[:lead])
    @lead.based_on_deal(@deal, current_user)
    session[:selected_category] = @lead.category_id

    @lead.creation_step = 3
    create! do |success, failure|
      success.html {
        redirect_to members_lead_path(@lead)
      }
    end
  end

  def edit
    @lead = Lead.requested_by_member(current_user).find(params[:id])
  end

  def show
    @lead = Lead.requested_by_member(current_user).find(params[:id])
  end

  def update
    @lead = Lead.requested_by_member(current_user).find(params[:id])

    update! do |success, failure|
      success.html { redirect_to params[:get_deal] == "1" ? members_lead_path(@lead) : members_leads_path }
      success.js { render :nothing => true }
      failure.html { redirect_to members_leads_path }
      failure.js { render :nothing => true }
    end
  end

  def destroy
    @lead = Lead.requested_by_member(current_user).find(params[:id])

    if @lead.destroy
      flash[:notice] = I18n.t("member.leads.destroy.flash.lead_deletion_successful")
    else
      flash[:notice] = I18n.t("member.leads.destroy.flash.lead_deletion_failure")
    end
    redirect_to members_leads_path
  end
end
