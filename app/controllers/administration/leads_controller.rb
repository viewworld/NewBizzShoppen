class Administration::LeadsController < Administration::AdministrationController
  inherit_resources
  actions :all, :except => [:create,:new]

  set_tab "leads"

  protected

  def collection
    @search = Lead.scoped_search(params[:search])
    @leads = @search.paginate(:page => params[:page], :per_page => Settings.default_leads_per_page)
  end

end