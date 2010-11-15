class LeadsController < ApplicationController
  inherit_resources
  actions :index, :show
  set_tab "browse_leads"

  before_filter :check_search, :only => :index

  protected

  def collection
    params[:search]||={}
    if current_user
      params[:search][:with_ids_not_in] = current_user.all_requested_lead_ids + current_user.all_purchased_lead_ids
    end

    params[:search][:without_locked_users] = "1"

    @search = Lead.scoped_search(params[:search])
    @leads = @search.paginate(:page => params[:page], :per_page => Settings.default_leads_per_page)
  end

  private

  def check_search
    redirect_to categories_path unless params[:search]
  end

end