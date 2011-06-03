class Callers::CampaignsController < Callers::CallerController
  inherit_resources
  set_tab "campaigns"
  helper :campaigns

  before_filter :set_campaign, :except => [:index, :new, :create]
  before_filter lambda {authorize_role(:call_centre, :admin)}, :except => :index
  before_filter lambda {authorize_manage_rights(@campaign)}, :only => [:edit,:update,:destroy,:show]

  def new
    @campaign = Campaign.new(:start_date => Date.today, :end_date => Date.today+1.week, :max_contact_number => 0,
                             :category_id => Category.first.id, :country_id => Country.first.id)
  end

  def create
    @campaign = Campaign.new(params[:campaign])
    @campaign.creator = current_user
    @campaign.results = Result.generic_results
    @campaign.users << current_user
    create! do |success, failure|
      success.html { redirect_to callers_campaigns_path }
      failure.html { render 'new' }
    end
  end

  def edit
    set_contacts
  end

  def update
    @campaign.attributes = params[:campaign]    
    update! do |success, failure|
      success.html { redirect_to edit_callers_campaign_path(@campaign) }
      failure.html { set_contacts; render 'edit' }
    end
  end

  def show
    set_contacts
    @all_results = Result.scoped
    @result_ids = params[:result_ids] || @all_results.map(&:id)
    @date_from = params[:date_from] ? params[:date_from].to_date : @campaign.start_date
    @date_to = params[:date_to] ? params[:date_to].to_date : @campaign.end_date
    @final = (params[:final] and params[:final] == "yes") ? true : false
    @agent_ids = params[:agent_ids] || []
    @agent_ids.delete("")
    @results = (@final ? @all_results.where(:final => true) : @all_results).where(:id => @result_ids)
    @headers = CallResult.for_table_header(@date_from, @date_to)
  end

  def result_details
    @call_results = CallResult.find_all_by_id(params[:call_result_ids].split(","))
  end

  def result_details_to_csv
    send_data CallResult.to_csv(params[:call_result_ids].split(",")), :filename => "call_result.csv"
  end

  protected

  def collection
    params[:search]||={}
    @search = Campaign.scoped_search(params[:search].merge(:available_for_user => current_user))
    @campaigns = @search.paginate(:page => params[:page], :per_page => 20)
  end

  def set_contacts
    params[:search]||={}
    params[:search][:ascend_by_company_name] = true unless params[:search][:descend_by_company_name] 
    @search = Contact.scoped_search(params[:search].merge(:for_campaign => @campaign))
    @contacts = @search.paginate(:page => params[:page], :per_page => 20)
  end

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

end