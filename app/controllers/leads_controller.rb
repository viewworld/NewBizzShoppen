class LeadsController < ApplicationController
  inherit_resources
  actions :index, :show
  set_tab "browse_leads"

  before_filter :check_category_buyer, :only => :index
  before_filter :check_search, :only => :index
  before_filter :check_token, :only => [:edit, :update]

  def show
    show! do |format|
      @lead.update_stats!(:clicks_count)
      format.html {}
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
    @leads = @search.includes(:currency).paginate(:page => params[:page], :per_page => Settings.default_leads_per_page)
    if @search.with_category.present?
      @search.with_selected_categories = Category.find_by_id(@search.with_category).self_and_descendants.map(&:id)
    end
    roots = @categories.select { |c| @search.with_selected_categories.to_a.map(&:to_i).include?(c.id) and c.parent_id.nil? }
    @category = @search.with_category.present? ? Category.find(@search.with_category) : roots.size == 1 ? roots.first : nil
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