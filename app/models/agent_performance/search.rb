class AgentPerformance::Search

  attr_accessor :date_from, :date_to, :agents, :call_centres, :currency_id, :active_results, :html

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

  AGENT_PERFORMANCES_PATH = "public/system/agent_performances"

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

  def to_html
    av = ActionView::Base.new
    av.view_paths << File.join(::Rails.root.to_s, "app", "views")
    av.instance_eval do
      extend ApplicationHelper
    end
    av.render(:partial => "callers/agent_performances/agents", :type => :erb, :locals => { :search => self })
  end

  def to_file
    @filename = "#{(Time.now.to_f*100000).to_i}"
    FileUtils.mkdir_p(Rails.root.join("#{AGENT_PERFORMANCES_PATH}/#{@current_user.id}"))
    @html = to_html
    html_path = Rails.root.join("#{AGENT_PERFORMANCES_PATH}/#{@current_user.id}/#{@filename}.html")
    File.open(html_path, 'w') {|f| f.write(@html) }
    html_path
    #File.open(Rails.root.join("#{AGENT_PERFORMANCES_PATH}/#{@current_user}/#{@filename}.temp"), 'w') {|f| f.write(markup(html)) }
    #store_pdf
  end

end