class CategorySuppliers::LeadsController < ApplicationController
  inherit_resources
  actions :index, :show
  set_tab "browse_leads"

  before_filter :redirect_if_not_category_supplier

  def show
    show! do |format|
      @lead.update_stats!(:clicks_count)
      format.html {  }
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
    end

    #params[:search][:with_category] = @home_category.id
    params[:search][:published_only] = "1"
    params[:search][:ascend_by_header] = true
    params[:search][:without_inactive] = true

    @categories = user_signed_in? ? current_user.parent_accessible_categories_without_auto_buy_with_descendants.with_leads.without_locked_and_not_published : LeadCategory.with_leads.without_locked_and_not_published.without_unique

    @countries = (current_user and current_user.has_accessible_categories?) ? Country.with_leads.within_accessible_categories(current_user) : Country.with_leads
    @creators = (current_user and current_user.has_accessible_categories?) ? User.with_leads.within_accessible_categories(current_user) : User.with_leads

    @displayed_category = @category = @home_category
    @search = Lead.scoped_search(params[:search])
    if @search.with_category.present?
      @search.with_selected_categories = @categories.find(@search.with_category).self_and_descendants.map(&:id)
    elsif @search.with_selected_categories.nil?
      @search.with_selected_categories = @home_category.self_and_descendants.map(&:id)
    else
      roots = @categories.select { |c| @search.with_selected_categories.map(&:to_i).include?(c.id) and c.parent_id.nil? }
      @displayed_category = roots.size == 1 ? (@search.with_selected_categories.map(&:to_i)-roots.first.self_and_descendants.map(&:id)).empty? ? roots.first : nil : nil
    end
    @leads = @search.paginate(:page => params[:page], :per_page => Settings.default_leads_per_page)
  end

  def redirect_if_not_category_supplier
    if current_user and !current_user.has_role?(:category_supplier)
      redirect_to categories_path
    end
  end

end