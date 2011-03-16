class LeadsController < ApplicationController
  inherit_resources
  actions :index, :show
  set_tab "browse_leads"

  before_filter :check_category_buyer, :only => [:index]
  before_filter :check_search, :only => :index

  def show
    show! do |format|
      format.html { @lead.increment!(:clicks_count) }
    end
  end


  def index
    index! do |format| 
      format.html { Lead.update_all("exposures_count = exposures_count+1", {:id => @leads.map(&:id)}) }
    end
  end

  protected

  def collection
    params[:search]||={}
    if current_user
      params[:search][:with_ids_not_in] = current_user.all_requested_lead_ids + current_user.all_purchased_lead_ids
      params[:search][:within_accessible_categories] = current_user.accessible_categories_ids if current_user.has_accessible_categories?
      if !current_user.has_accessible_categories? and current_user.has_role?(:customer)
        params[:search][:with_customer_unique_categories] = current_user.id
      else
        params[:search][:with_customer_unique_categories] = nil
      end
      if current_user.has_any_role?(:agent, :call_centre_agent)
        params[:search][:with_agent_unique_categories] = current_user.id
      else
        params[:search][:with_agent_unique_categories] = nil
      end
      params[:search][:without_bought_and_requested_by] = current_user
    else
      params[:search][:without_unique_categories] = "1"
    end

    params[:search][:without_locked_users] = "1"
    params[:search][:published_only] = "1"
    params[:search][:without_inactive] = true

    if current_user
      @categories = current_user.has_accessible_categories? ? Category.with_leads.within_accessible(current_user).without_locked_and_not_published : current_user.has_role?(:customer) ? Category.with_leads.without_locked_and_not_published.with_customer_unique(current_user) : Category.with_leads.without_locked_and_not_published.with_agent_unique(current_user)
    else
      @categories = Category.with_leads.without_locked_and_not_published.without_unique
    end

    @countries = (current_user and current_user.has_accessible_categories?) ? Country.with_leads.within_accessible_categories(current_user) : Country.with_leads
    @creators = (current_user and current_user.has_accessible_categories?) ? User.with_leads.within_accessible_categories(current_user) : User.with_leads
    @search = Lead.scoped_search(params[:search])
    @leads = @search.paginate(:page => params[:page], :per_page => Settings.default_leads_per_page)
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