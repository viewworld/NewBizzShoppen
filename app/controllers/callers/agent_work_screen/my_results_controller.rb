class Callers::AgentWorkScreen::MyResultsController < Callers::AgentWorkScreenController
  inherit_resources

  def collection
    params[:search]||={}
    @search = Contact.scoped_search(params[:search])
    @search.with_results = true
    @search.with_agent = current_user.id
    @contacts = @search.paginate(:page => params[:page], :per_page => 20)
  end
end