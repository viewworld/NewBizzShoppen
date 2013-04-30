class CampaignReport::Search

  attr_accessor :date_from, :date_to, :per_user, :with_results, :dont_show_results, :views_count, :campaign_selection,
                :result_ids, :call_centre_id, :call_centre_agent_ids, :currency_id, :user, :call_centre,
                :all_call_centres, :all_call_centre_agents, :selected_agents, :current_user, :campaign_reports,
                :all_campaigns, :campaign_ids, :all_results, :campaign_users, :search_options, :show_targets,
                :dont_show_calls

  include ActiveModel::Conversion
  extend ActiveModel::Naming

  DEFAULT_OPTIONS = {
      :date_from              => Date.today - 7,
      :date_to                => Date.today,
      :per_user               => false,
      :with_results           => false,
      :dont_show_results      => false,
      :campaign_selection     => "active",
      :result_ids             => nil,
      :call_centre_id         => nil,
      :call_centre_agent_ids  => [],
      :currency_id            => nil,
      :views_count            => 0,
      :show_targets           => false,
      :dont_show_calls        => false
  }

  def persisted?
    false
  end

  def initialize(options)
    options ||= {}
    self.search_options = options.reject{|k,v| [:controller, :action, :authenticity_token, :_method, :commit].include?(k.to_sym)}
    self.current_user = options[:current_user]

    DEFAULT_OPTIONS.merge(search_options.symbolize_keys).each do |k,v|
      if [:views_count].include?(k)
        instance_variable_set("@#{k}".to_sym, v.to_i)
      elsif [:date_from,:date_to].include?(k) and v.is_a?(String)
        instance_variable_set("@#{k}".to_sym, Date.parse(v))
      else
        instance_variable_set("@#{k}".to_sym, v)
      end
    end

    @per_user = true if current_user.has_any_role?(:call_centre_agent, :agent)

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

        @campaign_reports = @campaign_users.map { |user| @campaigns.map { |campaign| CampaignReport.new(campaign, @date_from, @date_to, { :user => user, :currency_id => @currency_id } ) } }.flatten
      else
        @campaign_reports = @campaigns.map { |campaign| CampaignReport.new(campaign, @date_from, @date_to, { :user => ((current_user.has_role?(:admin) and !@selected_agents.empty?) ? @selected_agents : nil), :currency_id => @currency_id }) }
      end
    else
      @campaign_reports = []
      @campaign_users = []
    end

    @campaign_reports.delete_if{ |cr| !cr.has_results? } if @with_results
  end

  def cached_campaign_reports
    begin
      Dir.new(Rails.root.join("#{Rails.root.join('public/system/campaign_reports_cache')}/#{@current_user.id}")).entries.sort.reverse.select{|f| f[/\d+\.html/]}
    rescue
      []
    end
  end


end