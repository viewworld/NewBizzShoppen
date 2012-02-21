class ::AgentTimesheet::General

  include AgentTimesheetCommon

  def colspan
    res = 0
    res += 1 if @display_hours
    res += 1 if @display_results
    res += 1 if @display_value
    res += 1 if @display_cost
    res
  end

  def to_html
    av = ActionView::Base.new
    av.view_paths << File.join(::Rails.root.to_s, "app", "views")
    av.instance_eval do
      extend ApplicationHelper
    end
    av.render(:partial => 'callers/agent_timesheets/index', :type => :erb, :locals => { :timesheet => self })
  end

  def to_file(notify=true)
    if @current_user
      @filename = "#{(Time.now.to_f*100000).to_i}"
      FileUtils.mkdir_p(Rails.root.join("public/system/agent_timesheets_cache/#{@current_user.id}"))
      File.open(Rails.root.join("public/system/agent_timesheets_cache/#{@current_user.id}/#{@filename}.html"), 'w') {|f| f.write(to_html) }
      notify! if notify
      @filename
    else
      nil
    end
  end

  def self.load(filename, current_user)
    begin
      File.open(Rails.root.join("public/system/agent_timesheets_cache/#{current_user.id}/#{filename}.html"), 'r') {|f| f.read }
    rescue
      "Agent Timesheet not found!"
    end
  end

  def self.destroy(filename, current_user)
    begin
      File.delete(Rails.root.join("public/system/agent_timesheets_cache/#{current_user.id}/#{filename}.html"))
    rescue
      "Agent Timesheet not found!"
    end
  end

  def url
    if @current_user and @filename
      "http://#{@current_user.domain_name}/callers/agent_timesheets/#{@filename}.html"
    end
  end

  def notify!
    if @current_user and url
      TemplateMailer.new(@current_user.email, :agent_timesheet, Country.get_country_from_locale, {:user => @current_user, :timesheet_url => url, :sender_id => nil}).deliver!
    end
  end

  def self.human_name
    "Agent Timesheet"
  end

end