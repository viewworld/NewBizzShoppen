class Callers::CampaignsController < Callers::CallerController
  inherit_resources
  set_tab "campaigns"
  helper :campaigns
  include ::CampaignActions

  before_filter :set_campaign, :except => [:index, :new, :create]
  before_filter lambda { authorize_role(:call_centre, :admin) }, :except => [:index, :result_details]
  before_filter lambda { authorize_manage_rights(@campaign) }, :only => [:edit, :update, :destroy, :show]
  before_filter lambda { authorize_role(:agent, :call_centre_agent, :call_centre, :admin) }, :only => [:result_details]
  before_filter :set_crm_campaigns, :only => [:update, :create]

  def new
    @campaign = Campaign.new(:start_date => Date.today, :end_date => Date.today+1.week, :max_contact_number => 0,
                             :category_id => LeadCategory.first.id, :country_id => Country.first.id)
  end

  def create
    @campaign = Campaign.new(params[:campaign])
    @campaign.creator = current_user
    @campaign.results = Result.generic_results
    @campaign.users << current_user unless current_user.admin?
    create! do |success, failure|
      success.html { redirect_to edit_callers_campaign_path(@campaign) }
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

  def destroy
    if @campaign.set_as_deleted!
      flash[:notice] = I18n.t("flash.campaigns.destroy.notice")
      @campaign.delay(:priority => -1, :queue => 'campaign_destroy').delayed_destroy(params[:with_agent_time] == "true")
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.js {  }
    end
  end

  def duplicate
    if current_user.admin?
      @campaign.duplicate!(:with_contacts => params[:with_contacts] == "true", :with_call_results => params[:with_call_results] == "true",
                           :with_agent_time => params[:with_agent_time] == "true", :user_to_notify => current_user)
    else
      raise CanCan::AccessDenied
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.js {  }
    end
  end

  def clear
    if current_user.admin?
      @campaign.clear!(:with_contacts => params[:with_contacts] == "true", :with_call_results => params[:with_call_results] == "true",
                       :with_agent_time => params[:with_agent_time] == "true", :user_to_notify => current_user)
    else
      raise CanCan::AccessDenied
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.js {  }
    end
  end

  def result_details
    @call_results = CallResult.where(:id => params[:call_result_ids].split(",")).paginate(:show_all => params[:show_all], :page => params[:page], :per_page => 50)
  end

  def export_result_details
    @call_result_ids = params[:call_result_ids].split(",")
    respond_to do |wants|
      wants.csv { send_data CallResult.to_csv(@call_result_ids), :filename => "#{@campaign.name}-call-results.csv".to_url }
      wants.xls { send_data render_to_string :template => 'callers/production/export', :filename => "#{@campaign.name}-call-results.xls".to_url }
    end
  end

  def results
    @campaigns = params[:campaign_ids] ? Campaign.find(params[:campaign_ids]) : Campaign.all
    @results = Result.for_campaigns(@campaigns.map(&:id)).with_reported.where(:final => true)
  end

  protected

  def set_crm_campaigns
    params[:campaign][:crm_campaigns] = params[:campaign][:crm_campaigns].blank? ? "" : params[:campaign][:crm_campaigns]*","
  end

  def collection
    params[:search]||={}
    params[:search][:with_state] ||= "active"
    @search = Campaign.scoped_search(params[:search].merge(:available_for_user => current_user))
    @campaigns = @search.paginate(:show_all => params[:show_all], :page => params[:page], :per_page => 20)
  end

end