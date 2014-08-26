class Callers::SoftphoneListingsController < Callers::CallerController
  set_tab 'reports'
  set_subtab 'softphone_listing'

  def show
    @search = User.without_locked.with_any_role([:agent, :call_centre_agent]).order("first_name").scoped_search(params[:search])
    @agents = @search.paginate(:page => params[:page], :per_page => 30)
  end
end
