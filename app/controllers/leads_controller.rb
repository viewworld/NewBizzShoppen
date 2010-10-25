class LeadsController < ApplicationController
  inherit_resources
  actions :all, :except => [:create, :update, :edit, :new]

  protected

  def collection
    @search = Lead.scoped_search(params[:search])
    @leads = @search.paginate(:page => params[:page], :per_page => 5)
  end

end