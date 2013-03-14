class Callers::CampaignReportsController < Callers::CallerController
  inherit_resources
  set_tab "financial"
  set_subtab "campaigns_reports"

  before_filter lambda {authorize_role(:call_centre, :admin, :call_centre_agent, :agent)}

  def index
    @search = CampaignReport::Search.new(params.merge(:current_user => current_user))
  end

  def create
    @search = CampaignReport::Search.new(params.merge(:current_user => current_user))

    if @search.campaign_reports.any?
      report_cache = "#{current_user.id}#{(Time.now.to_f*100000).to_i}"
      if Rails.env.development?
        CampaignReport::Table.new(report_cache, @search.campaign_reports, @search.campaign_users, @search.per_user, @search.result_ids, {:date_from => @search.date_from, :date_to => @search.date_to, :dont_show_results => @search.dont_show_results, :show_targets => @search.show_targets, :currency_id => @search.currency_id, :current_user => current_user.id}).table
        redirect_to callers_campaign_report_path(report_cache, @search.search_options)
      else
        CampaignReport::Table.new(report_cache, @search.campaign_reports, @search.campaign_users, @search.per_user, @search.result_ids, {:date_from => @search.date_from, :date_to => @search.date_to, :dont_show_results => @search.dont_show_results, :show_targets => @search.show_targets, :currency_id => @search.currency_id, :current_user => current_user.id}).delay(:queue => current_user_queue).table
        flash[:notice] = t("campaign_reports.index.report_queued")
        redirect_to callers_campaign_reports_path
      end
    else
      redirect_to new_callers_campaign_report_path(@search.search_options)
    end
  end

  def show
    @search = CampaignReport::Search.new(params.merge(:current_user => current_user))
    @html = File.open(Rails.root.join("public/html2pdf/campaign_reports_cache/#{params[:id]}.html"), 'r') {|f| f.read }

    respond_to do |format|
      format.html
      format.pdf { send_file CampaignReport.store_pdf(params[:id]), :type => 'application/pdf'}
    end
  end

  def new
    @search = CampaignReport::Search.new(params.merge(:current_user => current_user))
  end

  def load_agents
    @call_centre = User::CallCentre.find_by_id(params[:call_centre_id])
    @call_centre_agents = @call_centre.present? ? User.with_call_centre_agents(@call_centre) : []
    respond_to do |format|
      format.js
    end
  end
end