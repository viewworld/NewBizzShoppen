class LeadsController < ApplicationController
  inherit_resources
  actions :all, :except => [:create, :update, :edit, :new]

  protected

  def collection
    if current_user
      params[:search]||={}
      params[:search][:with_ids_not_in] = current_user.all_requested_lead_ids + current_user.all_bought_lead_ids
    end

    @search = Lead.scoped_search(params[:search])
    @leads = @search.paginate(:page => params[:page], :per_page => 5)
  end

end