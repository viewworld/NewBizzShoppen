class LeadsController < ApplicationController
  inherit_resources
  actions :all, :except => [:create, :update, :edit, :new]

  protected

  def collection
    @search = if current_user
                Lead.skip_already_bought_or_requested_by(current_user)
              else
                Lead
              end.scoped_search(params[:search])

    @leads = @search.paginate(:page => params[:page], :per_page => 5)
  end

end