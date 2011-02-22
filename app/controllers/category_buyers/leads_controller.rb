class CategoryBuyers::LeadsController < ApplicationController
  inherit_resources
  actions :index, :show
  set_tab "browse_leads"

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
    end

    params[:search][:with_category] = @home_category.id
    params[:search][:without_locked_users] = "1"
    params[:search][:published_only] = "1"
    params[:search][:ascend_by_header] = true

    @countries = (current_user and current_user.has_accessible_categories?) ? Country.with_leads.within_accessible_categories(current_user) : Country.with_leads

    @search = Lead.scoped_search(params[:search])
    @leads = @search.paginate(:page => params[:page], :per_page => Settings.default_leads_per_page)
  end

end