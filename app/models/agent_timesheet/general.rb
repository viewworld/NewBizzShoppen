class ::AgentTimesheet::General

  include AgentTimesheetCommon

  MARKUP_SCAFFOLD = %{<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml">
          <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <style type="text/css">
              @import url("../stylesheets/invoice.css") print;
            </style>
          </head>
          <body>
            %s
          </body>
        </html>}

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
      FileUtils.mkdir_p(Rails.root.join("#{TIMESHEETS_PATH}/#{@current_user.id}"))
      html = to_html
      File.open(Rails.root.join("#{TIMESHEETS_PATH}/#{@current_user.id}/#{@filename}.html"), 'w') {|f| f.write(html) }
      File.open(Rails.root.join("#{TIMESHEETS_PATH}/#{@current_user.id}/#{@filename}.temp"), 'w') {|f| f.write(markup(html)) }
      store_pdf
      notify! if notify
      @filename
    else
      nil
    end
  end

  def markup(html)
    av = ActionView::Base.new
    av.assigns[:invoice] = self
    av.instance_eval do
      extend InvoiceHelper
      extend ApplicationHelper
    end

    html.gsub!(/display:none;*/,'').gsub!(/<!-- cut -->.*?<!-- cut -->/m, '')

    File.read(Rails.root.join("app/views/layouts/pdf_timesheet.html")) % html
  end

  def store_pdf
    temp_path = Rails.root.join("#{TIMESHEETS_PATH}/#{@current_user.id}/#{@filename}.temp")
    pdf_path = Rails.root.join("#{TIMESHEETS_PATH}/#{@current_user.id}/#{@filename}.pdf")
    `python public/system/html2pdf/pisa.py #{temp_path} #{pdf_path}`
    File.delete(temp_path)
  end

  def self.load(filename, current_user)
    begin
      File.open(Rails.root.join("#{TIMESHEETS_PATH}/#{current_user.id}/#{filename}.html"), 'r') {|f| f.read }
    rescue
      "Agent Timesheet not found!"
    end
  end

  def self.load_pdf(filename, current_user)
    Rails.root.join("#{TIMESHEETS_PATH}/#{current_user.id}/#{filename}.pdf")
  end

  def self.destroy(filename, current_user)
    begin
      File.delete(Rails.root.join("#{TIMESHEETS_PATH}/#{current_user.id}/#{filename}.html"))
      File.delete(Rails.root.join("#{TIMESHEETS_PATH}/#{current_user.id}/#{filename}.pdf"))
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
      #TemplateMailer.new(@current_user.email, :agent_timesheet, Country.get_country_from_locale, {:user => @current_user, :timesheet_url => url, :sender_id => nil}).deliver!
      @current_user.notify!(
          :title => I18n.t("notifications.agent_timesheet.ready.title"),
          :text => I18n.t("notifications.agent_timesheet.ready.text", :url => url)
      )
    end
  end

  def self.human_name
    "Agent Timesheet"
  end

  def average_log_in(dow,agent)
    arr = stats.for_dow(dow).for_agent(agent).group(:week).select("MIN(log_in::TIME) as min_log_in").map{|t| Time.zone.parse(t.min_log_in).to_i}
    arr.size > 0 ? Time.zone.at(arr.sum / arr.size): nil
  end

  def average_log_out(dow,agent)
    arr = stats.for_dow(dow).for_agent(agent).group(:week).select("MAX(log_out::TIME) as min_log_out").map{|t| Time.zone.parse(t.min_log_out).to_i}
    arr.size > 0 ? Time.zone.at(arr.sum / arr.size) : nil
  end

end