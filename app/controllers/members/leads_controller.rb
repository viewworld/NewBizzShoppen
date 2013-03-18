class Members::LeadsController < Members::MemberController
  inherit_resources

  set_tab "created_leads"

  before_filter :check_if_deal_is_already_requested, :only => [:new, :create]
  before_filter :get_lead, :only => [:edit, :show, :redirect_to_paypal, :update, :destroy, :pdf]

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
    @leads = @search.order("created_at DESC").where(:requested_by => current_user.id).paginate(:show_all => params[:show_all], :page => params[:page], :per_page => Settings.default_leads_per_page)
  end

  def default_params_hash(params={})
    [[:contact_name, current_user.full_name], [:phone_number, current_user.phone], [:email_address, current_user.email],
     [:address_line_1, current_user.address.address_line_1], [:address_line_2, current_user.address.address_line_2],
     [:zip_code, current_user.address.zip_code], [:address_line_3, current_user.address.address_line_3],
     [:currency_id, Currency.default_currency.present? ? Currency.default_currency.id : nil], [:country, Country.get_country_from_locale]].each do |field|
      params[field.first] = field.last if params[field.first].blank?
    end

    params.merge({
                     :published => false,
                     :current_user => current_user
                 })
  end

  def check_if_deal_is_already_requested
    if (@deal = Deal.find_by_id(params[:deal_id]) and @deal.requested_by?(current_user)) or !current_user.can_request?(@deal)
      redirect_to deal_path(:id => @deal.slug)
    end
  end

  public

  def new
    @deal = Deal.find_by_id(params[:deal_id])
    @lead = Lead.new(params[:lead])
    @lead.based_on_deal(@deal, current_user)

    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def create
    @deal = Deal.find_by_id(params[:deal_id])
    @lead = (@deal.voucher_enabled? ? UnconfirmedLead : Lead).new(params[:lead])
    @lead.based_on_deal(@deal, current_user)
    session[:selected_category] = @lead.category_id

    @lead.creation_step = 3
    current_user.decrement_free_deal_requests_in_free_period! if @lead.valid?
    create! do |success, failure|
      success.html {
        redirect_to members_lead_path(@lead)
      }
      success.js { }
      failure.js { }
    end
  end

  def edit
  end

  def show
  end

  def redirect_to_paypal
    return redirect_to root_path unless @lead.deal.voucher_numbers.where(:user_id => current_user.id, :state => "used").first.blank?
    @voucher_number = @lead.deal.voucher_numbers.available_for_now(Time.now).first
    return redirect_to root_path if @voucher_number.blank?
    @voucher_number.reserve!(current_user)
  end

  def pdf
    voucher = @lead.deal.voucher_numbers.where(:user_id => current_user.id).where("state = 'used' or state = 'active'").first
    if voucher
      send_file voucher.file_path("pdf"), :type => 'application/pdf'
    else
      redirect_to :back
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to params[:get_deal] == "1" ? members_lead_path(@lead) : members_leads_path }
      success.js { render :nothing => true }
      failure.html { redirect_to members_leads_path }
      failure.js { render :nothing => true }
    end
  end

  def destroy
    if @lead.destroy
      flash[:notice] = I18n.t("member.leads.destroy.flash.lead_deletion_successful")
    else
      flash[:notice] = I18n.t("member.leads.destroy.flash.lead_deletion_failure")
    end
    redirect_to members_leads_path
  end

  def get_lead
    @lead = Lead.requested_by_member(current_user).find_by_id(params[:id]) || UnconfirmedLead.requested_by_member(current_user).find_by_id(params[:id])
  end

end
