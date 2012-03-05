class Callers::CampaignReportsController < Callers::CallerController
  inherit_resources
  set_tab "financial"
  set_subtab "campaigns_reports"

  before_filter lambda {authorize_role(:call_centre, :admin, :call_centre_agent, :agent)}

  def index
    super do |format|
      format.html
      format.pdf { send_file CampaignReport.store_pdf(params[:report]), :type => 'application/pdf'}
    end
  end

  def collection
    @date_from = params[:date_from] ? params[:date_from].to_date : Date.today-7
    @date_to = params[:date_to] ? params[:date_to].to_date : Date.today
    @per_user = params[:per_user].to_i == 1 ? true : false
    @per_user = true if current_user.has_any_role?(:call_centre_agent, :agent)
    @views_count = params[:views_count].to_i
    @campaign_selection = params[:campaign_selection] || "active"
    @result_ids = params[:result_ids] || nil
    @call_centre_id = params[:call_centre_id] || nil
    @call_centre_agent_ids = params[:call_centre_agent_ids] || []

    @all_results = Result.where(:final => true, :is_reported => true)

    if current_user.has_role?(:admin)
      @call_centre = User.find_by_id(@call_centre_id)
      @all_call_centres = User.with_call_centres
      @all_call_centre_agents = @call_centre ? User.with_call_centre_agents(@call_centre) : []
      @selected_agents = User.where(:id => @call_centre_agent_ids)
    else
      @selected_agents = []
    end

    if current_user.has_role?(:admin)
      @campaigns = Campaign.where("")
    elsif current_user.has_any_role?(:call_centre, :call_centre_agent, :agent)
      @campaigns = Campaign.available_for_user(current_user)
    end

    @campaign_ids = params[:campaign_ids] || @campaigns.map(&:id)

    @all_campaigns = @campaigns

    unless @campaign_ids.size == @campaigns.size
      @campaigns = !@campaign_ids.blank? ? @campaigns.where(:id => @campaign_ids) : @campaigns
    end

    @campaigns = @campaigns.select { |c| @campaign_selection == "active" ? c.active? : !c.active? } unless @campaign_selection == "all"

    if @views_count > 0
      if @per_user
        @campaign_users = if current_user.has_role?(:admin) and !@selected_agents.empty?
                            @selected_agents
                          elsif current_user.has_role?(:admin)
                            User.assigned_to_campaigns.with_results.for_campaigns(@campaigns.map(&:id))
                          elsif current_user.has_role?(:call_centre)
                            User.assigned_to_campaigns.with_results.for_campaigns(@campaigns.map(&:id)).where("users.id = :current_user_id OR users.parent_id = :current_user_id", {:current_user_id => current_user.id})
                          elsif current_user.has_any_role?(:call_centre_agent, :agent)
                            [current_user]
                          end

        @campaign_reports = @campaign_users.map { |user| @campaigns.map { |campaign| CampaignReport.new(campaign, @date_from, @date_to, user) } }.flatten
      else
        @campaign_reports = @campaigns.map { |campaign| CampaignReport.new(campaign, @date_from, @date_to, (current_user.has_role?(:admin) and !@selected_agents.empty?) ? @selected_agents : nil) }
      end
    else
      @campaign_reports = []
      @campaign_users = []
    end
  end

  def load_agents
    @call_centre = User::CallCentre.find_by_id(params[:call_centre_id])
    @call_centre_agents = @call_centre.present? ? User.with_call_centre_agents(@call_centre) : []
    respond_to do |format|
      format.js
    end
  end
end