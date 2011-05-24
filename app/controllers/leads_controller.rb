class LeadsController < ApplicationController
  inherit_resources
  actions :index, :show
  set_tab "browse_leads"

  before_filter :check_category_buyer, :only => [:index]
  before_filter :check_search, :only => :index

  def show
    show! do |format|
      @lead.update_stats!(:clicks_count)
      format.html {}
    end
  end

  def index
    index! do |format|
      format.html do
        @leads = @search.includes(:currency).paginate(:page => params[:page], :per_page => Settings.default_leads_per_page)
        Lead.update_all("exposures_count = exposures_count+1", {:id => @leads.map(&:id)})
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

  protected

  def collection
    params[:search]||={}
    if cu_or_user_from_rss_token
      params[:search][:with_ids_not_in] = cu_or_user_from_rss_token.all_requested_lead_ids + cu_or_user_from_rss_token.all_purchased_lead_ids
      params[:search][:within_accessible_categories] = cu_or_user_from_rss_token.accessible_categories_ids if cu_or_user_from_rss_token.has_accessible_categories?
      if !cu_or_user_from_rss_token.has_accessible_categories? and cu_or_user_from_rss_token.has_role?(:customer)
        params[:search][:with_customer_unique_categories] = cu_or_user_from_rss_token.id
      else
        params[:search][:with_customer_unique_categories] = nil
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

    params[:search][:published_only] = "1"
    params[:search][:without_inactive] = true

    if cu_or_user_from_rss_token
      @categories = cu_or_user_from_rss_token.has_accessible_categories? ? Category.with_leads.within_accessible(cu_or_user_from_rss_token).without_locked_and_not_published : cu_or_user_from_rss_token.has_role?(:customer) ? Category.with_leads.without_locked_and_not_published.with_customer_unique(cu_or_user_from_rss_token) : Category.with_leads.without_locked_and_not_published.with_agent_unique(cu_or_user_from_rss_token)
    else
      @categories = Category.with_leads.without_locked_and_not_published.without_unique
    end

    @countries = (cu_or_user_from_rss_token and cu_or_user_from_rss_token.has_accessible_categories?) ? Country.with_leads.within_accessible_categories(cu_or_user_from_rss_token) : Country.with_leads
    @creators = (cu_or_user_from_rss_token and cu_or_user_from_rss_token.has_accessible_categories?) ? User.with_leads.within_accessible_categories(cu_or_user_from_rss_token) : User.with_leads
    @search = Lead.scoped_search(params[:search])
    @category = @search.with_category.present? ? Category.find(@search.with_category) : nil
  end

  private

  def check_search
    redirect_to categories_path unless params[:search]
  end

  def check_category_buyer
    if current_user and current_user.has_role?(:category_buyer)
      redirect_to category_home_page_path(current_user.parent_buying_categories.first.cached_slug)
    end
  end

end