class Administration::ResultsController < Administration::AdministrationController
  set_tab "settings"
  set_subtab "results"

  before_filter :set_result, only: [:edit, :update]

  def index
    @search = Result.scoped_search(params[:search])
    @search.with_archived ||= 0
    @results = @search.order("name").paginate(show_all: params[:show_all], page: params[:page], per_page: Result.per_page)
  end

  def update
    if @result.update_attributes(params[:result_params])
      redirect_to administration_results_path
    else
      render :edit
    end
  end

  private
  def set_result
    @result = Result.find(params[:id])
  end
end
