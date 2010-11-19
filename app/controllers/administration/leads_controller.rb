class Administration::LeadsController < Administration::AdministrationController
  inherit_resources
  actions :all, :except => [:create,:new]

  protected

  def collection
    @search = Lead.scoped_search(params[:search])
    @leads = @search.paginate(:page => params[:page])
  end

end