class AgentPerformance::Search

  attr_accessor :date_from, :date_to, :agents, :call_centres, :currency_id, :active_results

  include ActiveModel::Conversion
  extend ActiveModel::Naming

  DEFAULT_OPTIONS = {
      :date_from        => Date.today,
      :date_to          => Date.today,
      :agents           => [],
      :call_centres     => [],
      :currency_id      => nil,
      :active_results   => true
  }

  def persisted?
    false
  end

  def initialize(options)
    options ||= {}

    DEFAULT_OPTIONS.merge(options.symbolize_keys).each do |k,v|
      if [:agents, :call_centres].include?(k)
        instance_variable_set("@#{k}".to_sym, User.find_all_by_id(v))
      elsif [:date_from,:date_to].include?(k) and v.is_a?(String)
        instance_variable_set("@#{k}".to_sym, Date.parse(v))
      else
        instance_variable_set("@#{k}".to_sym, v)
      end
    end
  end

  def all_agents
    @agents + @call_centres.map{ |u| [u] + u.subaccounts }.flatten
  end

  def all_agent_ids
    all_agents.map(&:id)
  end

end