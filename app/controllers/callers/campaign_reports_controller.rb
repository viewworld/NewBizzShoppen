class Callers::CampaignReportsController < Callers::CallerController
  inherit_resources
  set_tab "campaigns"

  before_filter lambda {authorize_role(:call_centre, :admin)}

  def collection
    @date_from = params[:date_from] ? params[:date_from].to_date : Date.today-3
    @date_to = params[:date_to] ? params[:date_to].to_date : Date.today+3
    @per_user = params[:per_user].to_i == 1 ? true : false

    if current_user.has_role?(:admin)
      @campaigns = Campaign.where("")
    elsif current_user.has_role?(:call_centre)
      @campaigns = Campaign.available_for_user(current_user)
    end

    if @per_user
      @campaign_users = current_user.has_role?(:admin) ?
                          User.assigned_to_campaigns.with_results.with_agents_without_call_centres :
                          User.assigned_to_campaigns.with_results.for_campaigns(@campaigns.map(&:id)).with_agents_without_call_centres.where("parent_id = ?", current_user.id)
    end
  end
end