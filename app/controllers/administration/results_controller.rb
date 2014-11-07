class Administration::ResultsController < Administration::AdministrationController
  include Controllers::CommonActions

  set_tab 'settings'
  set_subtab 'results'

  before_filter :set_result, only: [:edit, :update]

  def index
    @search = Result.scoped_search(params[:search])
    @search.with_archived ||= 0
    @results = @search.order('name').paginate(show_all: params[:show_all], page: params[:page], per_page: Result.per_page)
  end

  def update
    @result.assign_attributes(result_params)

    common_save(@result, success: { redirect: administration_results_path })
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end

  def result_params
    params.require(:result).permit(:name, :is_archived, :is_global)
  end
end
