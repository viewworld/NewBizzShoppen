class Payout::Search

  attr_accessor :date_from, :date_to, :campaign_selection, :result_ids, :call_centre_id, :call_centre_agent_ids,  :user,
                :call_centre, :all_call_centres, :all_call_centre_agents, :selected_agents, :current_user, :campaign_reports,
                :all_campaigns, :campaign_ids, :all_results, :campaign_users, :search_options, :call_results, :filename, :currency,
                :order_by, :order, :show_results_with_payout, :show_final_results, :show_temp_results

  include ActiveModel::Conversion
  extend ActiveModel::Naming

  DEFAULT_OPTIONS = {
      :date_from                => Date.today,
      :date_to                  => Date.today,
      :campaign_selection       => "active",
      :result_ids               => nil,
      :call_centre_id           => nil,
      :call_centre_agent_ids    => [],
      :order_by                 => 'date',
      :order                    => 'ASC',
      :show_results_with_payout => '1',
      :show_final_results       => '1',
      :show_temp_results        => '1'
  }

  PAYOUTS_PATH = "public/system/payouts"

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

    @currency = Currency.find_by_id(@currency_id)

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

    @all_results = Result.for_campaigns(@campaign_ids).with_reported

    @result_ids ||= @all_results.map(&:id)

    @all_campaigns = @campaigns.order("name")

    unless @campaign_ids.size == @campaigns.size
      @campaigns = !@campaign_ids.blank? ? @campaigns.where(:id => @campaign_ids) : @campaigns
    end

    @campaigns = @campaigns.select { |c| @campaign_selection == "active" ? c.active? : !c.active? } unless @campaign_selection == "all"

    @call_results = CallResult.joins(:contact).
        joins("INNER JOIN campaigns_results ON campaigns_results.result_id = call_results.result_id AND campaigns_results.campaign_id = leads.campaign_id").
        joins("INNER JOIN users ON users.id = call_results.creator_id").
        joins("INNER JOIN campaigns ON campaigns.id = campaigns_results.campaign_id").
        joins("INNER JOIN results ON results.id = campaigns_results.result_id").
        where(:leads => { :campaign_id => @campaigns.map(&:id) }, :result_id => @result_ids ).
        created_at_from(@date_from).created_at_to(@date_to)

    @call_results = @call_results.where("call_results.payout IS NOT NULL") if @show_results_with_payout == "1"

    unless @show_final_results == "1" and @show_temp_results == "1"
      @call_results = if @show_final_results == "0" and @show_temp_results == "0"
        @call_results.empty
      elsif @show_final_results == "1"
        @call_results.where("results.final IS TRUE")
      else
        @call_results.where("results.final IS NOT TRUE")
      end
    end

    @call_results = @call_results.where(:creator_id => @selected_agents) unless @call_centre_agent_ids.empty?

    @call_results = case @order_by
        when 'date' then @call_results.reorder("created_at #{@order}")
        when 'agent' then @call_results.reorder("users.email #{@order}")
        when 'campaign' then @call_results.reorder("campaigns.name #{@order}")
        when 'result' then @call_results.reorder("results.name #{@order}")
        else @call_results
    end
  end

  def to_html(type)
    av = ActionView::Base.new
    av.view_paths << File.join(::Rails.root.to_s, "app", "views")
    av.instance_eval do
      extend ApplicationHelper
    end
    av.render(:partial => "administration/payouts/#{type}", :type => :erb, :locals => { :search => self })
  end

  def markup(html)
    av = ActionView::Base.new
    av.assigns[:invoice] = self
    av.instance_eval do
      extend InvoiceHelper
      extend ApplicationHelper
    end
    File.read(Rails.root.join("app/views/layouts/pdf_payout.html")) % html
  end

  def store_pdf
    temp_path = Rails.root.join("#{PAYOUTS_PATH}/#{@filename}.temp")
    pdf_path = Rails.root.join("#{PAYOUTS_PATH}/#{@filename}.pdf")
    `python public/html2pdf/pisa.py #{temp_path} #{pdf_path}`
    File.delete(temp_path)
    pdf_path
  end

  def to_file(type)
    @filename = "#{(Time.now.to_f*100000).to_i}"
    FileUtils.mkdir_p(Rails.root.join(PAYOUTS_PATH))
    html = to_html(type)
    html_path = Rails.root.join("#{PAYOUTS_PATH}/#{@filename}.html")
    File.open(html_path, 'w') {|f| f.write(html) }
    File.open(Rails.root.join("#{PAYOUTS_PATH}/#{@filename}.temp"), 'w') {|f| f.write(markup(html)) }
    store_pdf
  end

  def reorder_link(name)
    if @order_by == name
      "order_payout('#{@order_by}', '#{@order == 'ASC' ? 'DESC' : 'ASC'}')"
    else
      "order_payout('#{name}', 'ASC')"
    end
  end

end