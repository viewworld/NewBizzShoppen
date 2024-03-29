module CampaignActions

  public

  def show
    set_locals
  end

  protected

  def set_locals(search_params = params)
    set_contacts
    #campaign_result_ids =  Array(@campaign).map(&:results).flatten.uniq.map(&:id)
    campaign_result_ids = CallResult.select("call_results.result_id").joins("JOIN leads on leads.id = call_results.contact_id").where("leads.campaign_id IN (?)", Array(@campaign)).where("leads.type = 'Contact'").map(&:result_id).uniq
    @all_results = Result.where("results.id IN (?)", campaign_result_ids)
    @result_ids = search_params[:result_ids] || @all_results.map(&:id)

    @date_from = search_params[:date_from] ? search_params[:date_from].to_date : Date.today
    @date_to = search_params[:date_to] ? search_params[:date_to].to_date : Date.today
    @final = (search_params[:final] and search_params[:final] == "yes") ? true : false
    @agent_ids = search_params[:agent_ids] || []
    if current_user.has_role?(:call_centre)
      @agent_ids = (@agent_ids.to_a.map(&:to_i) & current_user.subaccounts.map(&:id)).map(&:to_s)
    elsif current_user.has_any_role?(:agent, :call_centre_agent)
      @agent_ids = [current_user.id]
    end
    @agent_ids.delete("")
    @results = (@final ? @all_results.where(:final => true) : @all_results).where(:id => @result_ids)
    @headers = CallResult.for_table_header(@date_from, @date_to)
    @campaign_users = User.select("DISTINCT(users.*)").joins("JOIN call_results ON call_results.creator_id = users.id").joins("JOIN leads on leads.id = call_results.contact_id").where("leads.campaign_id IN (?)", Array(@campaign)).where("leads.type = 'Contact'").with_agents_without_call_centres
    @contact_columns = (search_params[:contact_columns] || []).reject(&:blank?)
    @result_fields = search_params[:result_fields] || {}
    #@campaign_users = @campaign.is_a?(Array) ? (current_user.has_role?(:admin) ?
    #    User.where(:id => CampaignsUser.joins("inner join call_results on campaigns_users.user_id=call_results.creator_id").select("distinct(campaigns_users.user_id)").map(&:user_id)).with_agents_without_call_centres :
    #    User.where(:id => CampaignsUser.joins("inner join call_results on campaigns_users.user_id=call_results.creator_id").select("distinct(campaigns_users.user_id)").where("campaigns_users.campaign_id in (?)", @campaign).map(&:user_id)).where("parent_id = ?", current_user.id).with_agents_without_call_centres) :
    #    @campaign.users.with_agents_without_call_centres
  end

  def set_contacts
    params[:search]||={}
    params[:search][:ascend_by_company_name] = true unless params[:search][:descend_by_company_name]
    @search = Contact.scoped_search(params[:search].merge(:for_campaign => @campaign.is_a?(Array) ? 0 : @campaign))
    @contacts = @search.paginate(:show_all => params[:show_all], :page => params[:page], :per_page => 20)
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
