class LeadsController < ApplicationController
  inherit_resources
  actions :index, :show
  set_tab "browse_leads"

  before_filter :check_search, :only => :index

  protected

  def collection
    if current_user
      params[:search]||={}
      params[:search][:with_ids_not_in] = current_user.all_requested_lead_ids + current_user.all_purchased_lead_ids
    end

    @search = Lead.scoped_search(params[:search])
    @leads = @search.paginate(:page => params[:page], :per_page => 5)
  end

  private

  def check_search
    redirect_to categories_path unless params[:search]
  end

end