class Administration::PayoutsController < Administration::AdministrationController

  inherit_resources

  set_tab "reports"
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
    @search = Payout::Search.new(params.merge(:current_user => current_user))
    @call_results = @search.call_results.paginate(:page => params[:page], :per_page => 50, :show_all => params[:show_all])
  end

  def call_result
    @call_result = CallResult.find(params[:id])
    @call_result.payout = params[:payout] if params[:payout]
    @call_result.value = params[:value] if params[:value]
  end

  def campaign_result
    @campaign_result = ::CampaignsResult.find(params[:id])
    @campaign_result.value = params[:value]
  end

  def edit_dynamic_values
    @call_result = CallResult.find(params[:id])
    render :partial => 'edit_dynamic_values', :layout => false
  end

  def update_dynamic_values
    @call_result = CallResult.find(params[:id])
    @call_result.update_attributes(params[:call_result])
  end

  def agents
    collection
    respond_to do |format|
      format.pdf { send_file @search.to_file(:agents), :type => 'application/pdf'}
    end
  end

  def campaigns
    collection
    respond_to do |format|
      format.pdf { send_file @search.to_file(:campaigns), :type => 'application/pdf'}
    end
  end

end
