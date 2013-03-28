class Administration::PayoutsController < Administration::AdministrationController

  inherit_resources

  set_tab "financial"
  set_subtab "payout"

  before_filter do
    params[:search] ||= {}
    params[:search][:created_at_from] = Date.today unless params[:search][:created_at_from].present?
    params[:search][:created_at_to] = Date.today unless params[:search][:created_at_to].present?
    params[:search][:with_creator] ||= []
    params[:with_agent] = params[:search][:with_creator].clone
    (params[:with_call_centre] ||= []).each do |call_centre|
      params[:search][:with_creator] << User::CallCentre.find(call_centre).children.map{|cc| cc.id.to_s}
    end
    params[:search][:with_creator].flatten!
    params[:search][:with_creator] << false if params[:search][:with_creator].empty?
  end

  def collection
    @search = CallResult.scoped_search(params[:search])
    @call_results = @search.order("created_at DESC").paginate(:page => params[:page], :per_page => 50)
  end

  def call_result
    @call_result = CallResult.find(params[:id])
    @call_result.payout = params[:payout]
  end

end
