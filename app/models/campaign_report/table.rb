class CampaignReport::Table
  def initialize(report_cache,campaign_reports,campaign_users,per_user=false,result_ids=nil,options={})
    @report_cache = report_cache
    @campaign_reports = campaign_reports
    @campaign_users = campaign_users
    @per_user = per_user
    @result_ids = result_ids
    @options = options
    @current_user = User.find_by_id(options[:current_user])
  end

  def table
    av = ActionView::Base.new
    av.view_paths << File.join(::Rails.root.to_s, "app", "views")
    av.instance_eval do
      extend ApplicationHelper
    end
    html = av.render(:partial => 'callers/campaign_reports/report', :type => :erb, :locals => { :per_user => @per_user, :campaign_users => @campaign_users, :campaign_reports => @campaign_reports, :result_ids => @result_ids, :options => @options })
    File.open(Rails.root.join("public/html2pdf/campaign_reports_cache/#{@report_cache}.html"), 'w') {|f| f.write(html) }
    markup = File.read(Rails.root.join("app/views/layouts/pdf_report.html")) % [@options[:date_from], @options[:date_to], html]
    File.open(Rails.root.join("public/html2pdf/campaign_reports_cache/#{@report_cache}.pdf.html"), 'w') {|f| f.write(markup) }
    notify!
    html
  end

  def url
    if @current_user and @report_cache
      "http://#{@current_user.domain_name}/callers/campaign_reports/#{@report_cache}.html"
    end
  end

  def notify!
    if @current_user and url
      @current_user.with_role.notify!(
          :title => I18n.t("notifications.campaign_report.ready.title"),
          :text => I18n.t("notifications.campaign_report.ready.text", :url => url)
      )
    end
  end

  def self.human_name
    "Campaign Report"
  end
end