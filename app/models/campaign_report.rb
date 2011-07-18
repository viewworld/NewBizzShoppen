class CampaignReport

  MARKUP_SCAFFOLD = %{<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml">
          <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <style type="text/css">
              @import url("../stylesheets/campaign_report.css") print;
            </style>
          </head>
          <body>
            %s
          </body>
        </html>}

  attr_accessor :campaign, :date_from, :date_to, :user

  def initialize(campaign, date_from, date_to, user=nil)
    self.campaign = campaign
    self.date_from = date_from.to_date
    self.date_to = date_to.to_date
    self.user = user
  end

  def target_success_percent
    campaign.success_rate.to_f
  end

  def realised_success_percent
    if frc = final_results.count.to_f and frc.eql?(0.0)
      frc
    else
      (final_results.with_success.count.to_f / frc) * 100
    end
  end

  def target_finished_contacts_per_hour
    campaign.finished_contacts_per_hour.to_f
  end

  def realised_finished_contacts_per_hour
    if th = total_hours and th.eql?(0.0)
      th
    else
      finished_contacts.count / th
    end
  end

  def target_final_result(result)
    cresult = campaign.campaigns_results.joins(:result).where("results.id = ?", result.id).first
    cresult.nil? ? 0.0 : cresult.expected_completed_per_hour.to_f
  end

  def realised_final_result(result)
    frc = final_results(result).count
    th = total_hours
    (frc > 0 and th > 0) ? (frc / th) : 0
  end

  def self.final_results
    Result.where(:final => true, :is_reported => true).order("name")
  end

  def target_value_per_hour
    campaign.euro_production_value_per_hour.to_f
  end

  def realised_value_per_hour
    if th = total_hours and th.eql?(0.0)
      th
    else
      total_value.to_f / th
    end
  end

  def total_number_of_contacts
    campaign.contacts.count
  end

  def completed_number_of_contacts
    cc = Contact.with_completed_status(true).joins(:call_results).where("leads.campaign_id = ? and call_results.created_at::DATE BETWEEN ? AND ?",
                                                                  campaign.id, date_from, date_to)
    cc = cc.where("call_results.creator_id = ?", user.id) if user
    cc.select("distinct(leads.id)").count
  end

  def completion_percent
    campaign.completion.to_f
  end

  def value_created
    total_value
  end

  def leads_sold_total_value
    leads_sold.sum("lead_purchases.euro_price * lead_purchases.quantity").to_f
  end

  def leads_sold_count
    leads_sold.sum("lead_purchases.quantity").to_i
  end

  def hours_used
    total_hours
  end

  def production_cost
    total_cost
  end

  def target_result
    value_created - production_cost
  end

  def realised_result
    leads_sold_total_value - production_cost
  end

  def self.store_pdf(report_cache)
    pdf_path = Rails.root.join "public/html2pdf/campaign_reports_cache/#{report_cache}.pdf"
    html_path = Rails.root.join "public/html2pdf/campaign_reports_cache/#{report_cache}.html"
    unless File.exists? pdf_path
      `python public/html2pdf/pisa.py #{html_path} #{pdf_path}`
      File.delete(html_path)
    end
    pdf_path
  end

  def self.table(report_cache,campaign_reports,campaign_users,per_user=false)
    av = ActionView::Base.new
    av.view_paths << File.join(::Rails.root.to_s, "app", "views")
    av.instance_eval do
      extend ApplicationHelper
    end
    html = av.render(:partial => 'callers/campaign_reports/report', :type => :erb, :locals => { :per_user => per_user, :campaign_users => campaign_users, :campaign_reports => campaign_reports })
    markup = MARKUP_SCAFFOLD % html
    File.open(Rails.root.join("public/html2pdf/campaign_reports_cache/#{report_cache}.html"), 'w') {|f| f.write(markup) }
    html
  end

  private

  def final_results(result=nil)
    rsp = CallResult.final_for_campaign(campaign).where("call_results.created_at::DATE BETWEEN ? AND ?", date_from, date_to).with_reported
    rsp = rsp.where("call_results.creator_id = ?", user.id) if user
    rsp = rsp.where("results.id = ?", result.id) if result
    rsp
  end

  def user_session_logs(_user=nil)
    th = campaign.user_session_logs.where("created_at::DATE BETWEEN ? AND ?", date_from, date_to)
    _user = _user || user
    th = th.where("user_id = ?", _user.id) if _user
    th
  end

  def total_hours(_user=nil)
    th = user_session_logs(_user || user)
    th.sum(:hours_count).to_f
  end

  def total_billing(_user=nil)
    th = user_session_logs(_user || user)
    th.sum("hours_count * euro_billing_rate").to_f
  end

  def finished_contacts
    fc = Contact.with_completed_status(true).where("campaign_id = ? and call_results.created_at::DATE BETWEEN ? AND ? and results.final is true and results.is_reported is true", campaign.id, date_from, date_to).
        joins(:call_results => [:result])
    fc = fc.where("call_results.creator_id = ?", user.id) if user
    fc
  end

  def total_value
    not_upgraded = CallResult.final_for_campaign(campaign).where("results.upgrades_to_lead is false and call_results.created_at::DATE BETWEEN ? AND ?", date_from, date_to).with_reported
    not_upgraded = not_upgraded.where("call_results.creator_id = ?", user.id) if user

    upgraded = CallResult.final_for_campaign(campaign).where("results.upgrades_to_lead is true and call_results.created_at::DATE BETWEEN ? AND ?", date_from, date_to).with_reported.
        joins(:contact => :lead)
    upgraded = upgraded.where("call_results.creator_id = ?", user.id) if user

    not_upgraded.sum("campaigns_results.euro_value").to_f + upgraded.sum("leads_leads.euro_price").to_f
  end

  def leads_sold
    sold = CallResult.final_for_campaign(campaign).where("results.upgrades_to_lead is true and call_results.created_at::DATE BETWEEN ? AND ?", date_from, date_to).with_reported.
        joins(:contact => {:lead => [:lead_purchases]})
    sold = sold.where("call_results.creator_id = ?", user.id) if user
    sold
  end

  def total_cost
    if campaign.cost_type == Campaign::FIXED_COST
      user ?  (campaign.euro_fixed_cost_value / campaign.users.with_results.count) : campaign.euro_fixed_cost_value
    elsif campaign.cost_type == Campaign::FIXED_HOURLY_RATE_COST
      campaign.euro_fixed_cost_value * total_hours
    elsif campaign.cost_type == Campaign::AGENT_BILLING_RATE_COST
      user ? (user.euro_billing_rate.to_f * total_hours(user)) : campaign.users.map { |u| total_billing(u) }.sum
    elsif campaign.cost_type == Campaign::NO_COST
      0.0
    end
  end


end