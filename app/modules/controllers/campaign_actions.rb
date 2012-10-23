module CampaignActions

  public

  def show
    set_locals
  end

  protected

  def set_locals
    set_contacts
    campaign_result_ids =  Array(@campaign).map(&:results).flatten.uniq.map(&:id)
    @all_results = Result.where("results.id IN (?)", campaign_result_ids)
    @result_ids = params[:result_ids] || @all_results.map(&:id)

    @date_from = params[:date_from] ? params[:date_from].to_date : @campaign.is_a?(Array) ? @campaign.map(&:start_date).sort.first : @campaign.start_date
    @date_to = params[:date_to] ? params[:date_to].to_date : @campaign.is_a?(Array) ? @campaign.map(&:end_date).sort.reverse.first : @campaign.end_date
    @final = (params[:final] and params[:final] == "yes") ? true : false
    @agent_ids = params[:agent_ids] || []
    if current_user.has_role?(:call_centre)
      @agent_ids = (@agent_ids.to_a.map(&:to_i) & current_user.subaccounts.map(&:id)).map(&:to_s)
    elsif current_user.has_any_role?(:agent, :call_centre_agent)
      @agent_ids = [current_user.id]
    end
    @agent_ids.delete("")
    @results = (@final ? @all_results.where(:final => true) : @all_results).where(:id => @result_ids)
    @headers = CallResult.for_table_header(@date_from, @date_to)
    @campaign_users = @campaign.is_a?(Array) ? (current_user.has_role?(:admin) ?
        User.where(:id => CampaignsUser.joins("inner join call_results on campaigns_users.user_id=call_results.creator_id").select("distinct(campaigns_users.user_id)").map(&:user_id)).select { |u|  !u.call_centre?} :
        #User.assigned_to_campaigns.with_results.with_agents_without_call_centres :
        User.assigned_to_campaigns.with_results.for_campaigns(@campaign).with_agents_without_call_centres.where("parent_id = ?", current_user.id)) :
        @campaign.users.with_agents_without_call_centres
  end

  def set_contacts
    params[:search]||={}
    params[:search][:ascend_by_company_name] = true unless params[:search][:descend_by_company_name]
    @search = Contact.scoped_search(params[:search].merge(:for_campaign => @campaign.is_a?(Array) ? 0 : @campaign))
    @contacts = @search.paginate(:page => params[:page], :per_page => 20)
  end

  def set_campaign
    @campaign = Campaign.find_by_id(params[:id])
    if @campaign.nil?
      if current_user.has_role?(:admin)
        @campaigns = Campaign.where("")
      elsif current_user.has_any_role?(:call_centre, :call_centre_agent, :agent)
        @campaigns = Campaign.available_for_user(current_user)
      end
      if @campaigns
        @all_campaigns = @campaigns.to_a
        campaign_ids = params[:campaign_ids] || []
        campaign_ids.delete("")
        @campaign = (!campaign_ids.blank? ? @campaigns.where(:id => campaign_ids) : @campaigns).to_a
      end
    end
  end
end