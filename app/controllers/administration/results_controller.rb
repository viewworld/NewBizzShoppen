class Administration::ResultsController < Administration::AdministrationController
  inherit_resources

  set_tab "settings"
  set_subtab "results"

  def update
    update! do |success, failure|
      success.html { redirect_to administration_results_path }
    end
  end

  protected

  def collection
    @search = Result.scoped_search(params[:search])
    @search.with_archived ||= 0
    @results = @search.order("name").paginate(:show_all => params[:show_all], :page => params[:page], :per_page => Result.per_page)
  end

end