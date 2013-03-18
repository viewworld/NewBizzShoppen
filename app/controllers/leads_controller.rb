class LeadsController < ApplicationController
  inherit_resources
  actions :index, :show
  set_tab "browse_leads"

  before_filter :check_category_supplier, :only => :index
  before_filter :check_search, :only => :index
  before_filter :check_token, :only => [:edit, :update]

  def show
    show! do |format|
      if @lead.can_be_shown_to?(current_user)
        @lead.update_stats!(:clicks_count)
        format.html {}
      else
        format.html {
          flash[:alert] = t("leads.show.view.no_longer_active")
          redirect_to root_path
        }
      end
    end
  end

  def edit
    @lsr.update_attribute(:last_visit_date, Time.now)
  end

  def update
    if params[:confirmation] == "disagree"
      @lsr.change_state("disagree")
      flash[:notice] = "Thank you for your time"
      redirect_to login_path
    else
      @lead.update_attributes(params[:lead])
      if @lead.save
        @lsr.change_state("agreed")
        flash[:notice] = "Lead successfully updated"
        redirect_to new_certification_account_path(:lead_id => @lead.id)
      else
        redirect_to edit_lead_path(@lead, :token => @lsr.token)
      end

    end
  end

  def index
    index! do |format|
      format.html do
        Lead.update_all("exposures_count = exposures_count+1", {:id => @leads.map(&:id)})
        if @search.with_category.present?
          @search.with_selected_categories = LeadCategory.find_by_id(@search.with_category).self_and_descendants.map(&:id)
        end
      end
      format.rss do
        @leads = @search.includes(:currency)
        render :layout => false
      end
    end
  end

  def cu_or_user_from_rss_token
    current_user ? current_user : User.find_by_rss_token(params[:user_token])
  end

  def creators
    @with_created_by = params[:with_created_by]
    @with_selected_categories = params[:with_selected_categories]
    @creators = User.screen_name_and_id_with_leads.with_leads_within_categories(@with_selected_categories)
  end

  protected

  def collection
    params[:search]||={}
    if cu_or_user_from_rss_token
      params[:search][:with_ids_not_in] = cu_or_user_from_rss_token.all_requested_lead_ids + cu_or_user_from_rss_token.all_purchased_lead_ids
      if cu_or_user_from_rss_token.has_any_role?(:supplier, :lead_supplier, :lead_user)
        params[:search][:with_supplier_unique_categories] = cu_or_user_from_rss_token.parent ? cu_or_user_from_rss_token.parent_id : cu_or_user_from_rss_token.id
      else
        params[:search][:with_supplier_unique_categories] = nil
      end
      if cu_or_user_from_rss_token.has_any_role?(:agent, :call_centre_agent)
        params[:search][:with_agent_unique_categories] = cu_or_user_from_rss_token.id
      else
        params[:search][:with_agent_unique_categories] = nil
      end
      params[:search][:without_bought_and_requested_by] = cu_or_user_from_rss_token
    else
      params[:search][:without_unique_categories] = "1"
    end

    if !user_signed_in? or (user_signed_in? and !current_user.has_role?(:member))
      params[:search][:published_only] = "1"
      params[:search][:without_inactive] = true
    end

    if cu_or_user_from_rss_token and cu_or_user_from_rss_token.has_role?(:admin)
      @categories_scope = LeadCategory.scoped
    elsif cu_or_user_from_rss_token
      @categories_scope = cu_or_user_from_rss_token.has_any_role?(:supplier, :lead_supplier, :lead_user) ? LeadCategory.without_locked_and_not_published.with_supplier_unique(cu_or_user_from_rss_token).scoped : LeadCategory.without_locked_and_not_published.with_agent_unique(cu_or_user_from_rss_token).scoped
    else
      @categories_scope = LeadCategory.without_locked_and_not_published.without_unique.scoped
    end

    unless params[:search].keys.any? { |k| k =~ /scend_by/}
      params[:search][:descend_by_leads_id] = true
    end

    @search = Lead.scoped_search(params[:search])
    @leads = @search.includes(:currency).paginate(:show_all => params[:show_all], :page => params[:page], :per_page => Settings.default_leads_per_page)
    if @search.with_category.present?
      @category = @categories_scope.find_by_id(@search.with_category)
      @nested_category = @category
      @category = @category.root if @category and !@category.root?
    elsif @search.with_selected_categories.present?
      category = @categories_scope.where("categories.id in (?)", @search.with_selected_categories).first
      @category = category ? category.root : nil
      @nested_category = category ? category : nil
    end
    @categories = @category ? @categories_scope.with_leads.where("categories.id in (?)", @category.self_and_descendants.map(&:id)) : []
    @countries = Country.with_leads_in_categories(@search.with_category ? Category.find_by_id(@search.with_category).self_and_descendants.map(&:id) : @search.with_selected_categories)
  end

  private

  def check_search
    redirect_to categories_path unless params[:search]
  end

  def check_category_supplier
    if current_user and current_user.has_role?(:category_supplier)
      redirect_to category_home_page_path(current_user.parent_buying_categories.first.cached_slug)
    end
  end

  def check_token
    @lsr = LeadCertificationRequest.find_by_token(params[:token])
    if @lsr and @lsr.active?
      @lead = @lsr.lead
    else
      flash[:notice] = t("leads.certification.invalid_token")
      redirect_to login_path
    end
  end

end