class ::AgentTimesheet::General

  include AgentTimesheetCommon

  def build_select(grp)
    sel = grp.dup
    sel << "SUM(hours) as hours" if @display_hours
    sel << "SUM(results) as results" if @display_results
    sel << "SUM(value) as value" if @display_value
    sel.join(",")
  end

  def overview_data
    grp = [:year, :week , :dow]
    scoped.select(build_select(grp)).group(grp.join(",")).group_by_multiple(grp)
  end

  def team_result_sheet_data
    grp = [:year, :week, :user_id, :dow]
    scoped.select(build_select(grp)).group(grp.join(",")).group_by_multiple(grp)
  end

  def agent_time_sheet_data(agent)
    grp = [:first_result, :last_result, :log_out_time, :week, :dow, :year, :user_id]
    scoped.select(build_select(grp)).group(grp.join(",")).where(:user_id => agent.to_i).group_by_multiple([:year, :week, :dow])
  end

  def colspan
    res = 0
    res += 1 if @display_hours
    res += 1 if @display_results
    res += 1 if @display_value
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

  def url
    if @current_user and @filename
      "http://#{@current_user.domain_name}/callers/agent_timesheets/#{@filename}.html"
    end
  end

  def notify!
    if @current_user and url
      TemplateMailer.delay.new(@current_user.email, :agent_timesheet, Country.get_country_from_locale, {:user => @current_user, :timesheet_url => url, :sender_id => nil})
    end
  end

end