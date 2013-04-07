class Payout::Search

  attr_accessor :date_from, :date_to, :campaign_selection, :result_ids, :call_centre_id, :call_centre_agent_ids,  :user,
                :call_centre, :all_call_centres, :all_call_centre_agents, :selected_agents, :current_user, :campaign_reports,
                :all_campaigns, :campaign_ids, :all_results, :campaign_users, :search_options, :call_results

  include ActiveModel::Conversion
  extend ActiveModel::Naming

  DEFAULT_OPTIONS = {
      :date_from              => Date.today,
      :date_to                => Date.today,
      :campaign_selection     => "active",
      :result_ids             => nil,
      :call_centre_id         => nil,
      :call_centre_agent_ids  => []
  }

  def persisted?
    false
  end

  def initialize(options)
    options ||= {}
    self.search_options = options.reject{|k,v| [:controller, :action, :authenticity_token, :_method, :commit].include?(k.to_sym)}
    self.current_user = options[:current_user]

    DEFAULT_OPTIONS.merge(search_options.symbolize_keys).each do |k,v|
      if [:date_from,:date_to].include?(k) and v.is_a?(String)
        instance_variable_set("@#{k}".to_sym, Date.parse(v))
      else
        instance_variable_set("@#{k}".to_sym, v)
      end
    end

    if current_user.has_role?(:admin)
      self.call_centre = User.find_by_id(@call_centre_id)
      self.all_call_centres = User.with_call_centres
      self.all_call_centre_agents = @call_centre ? User.with_call_centre_agents(@call_centre) : []
      self.selected_agents = User.where(:id => @call_centre_agent_ids)
    else
      self.selected_agents = []
    end

    if current_user.has_role?(:admin)
      @campaigns = Campaign.where("")
    elsif current_user.has_any_role?(:call_centre, :call_centre_agent, :agent)
      @campaigns = Campaign.available_for_user(current_user)
    end

    @campaign_ids = @campaign_ids || @campaigns.map(&:id)

    @all_results = Result.for_campaigns(@campaign_ids).with_reported.where(:final => true)

    @all_campaigns = @campaigns.order("name")

    unless @campaign_ids.size == @campaigns.size
      @campaigns = !@campaign_ids.blank? ? @campaigns.where(:id => @campaign_ids) : @campaigns
    end

    @campaigns = @campaigns.select { |c| @campaign_selection == "active" ? c.active? : !c.active? } unless @campaign_selection == "all"

    @call_results = CallResult.joins(:contact).
        where(:creator_id => @selected_agents, :leads => { :campaign_id => @campaigns.map(&:id) }, :result_id => @result_ids ).
        created_at_from(@date_from).created_at_to(@date_to)
  end

end