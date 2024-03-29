class CampaignReport

  attr_accessor :campaign, :date_from, :date_to, :user, :selected_result_ids, :currency_id

  def initialize(campaign, date_from, date_to, options)
    self.campaign = campaign
    self.date_from = date_from.to_date
    self.date_to = date_to.to_date
    self.user = options[:user]
    self.currency_id = options[:currency_id]
    self.selected_result_ids = options[:selected_result_ids] unless options[:selected_result_ids].nil? or options[:selected_result_ids].empty?
  end

  def selected_users?(_user=nil)
    _user = _user || user
    !_user.nil? and (_user.is_a?(Array) or _user.is_a?(ActiveRecord::Relation)) and !_user.empty?
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

  def realised_finished_results_per_hour
    if th = total_hours and th.eql?(0.0)
      0
    else
      final_results.count / th
    end
  end

  def target_all_results_per_hour
    campaign.campaigns_results.where("is_reported is TRUE").sum(:expected_completed_per_hour)
  end

  def realised_all_results_per_hour
    if th = total_hours and th.eql?(0.0)
      0
    else
      all_call_results.count / th
    end
  end

  def target_temp_result_per_hour
    if fr = final_results.count and fr > 0
      (temp_results.count / fr.to_f) * total_number_of_contacts
    else
      0
    end
  end

  def realised_temp_result_per_hour
    if th = total_hours and th.eql?(0.0)
      0
    else
      temp_results.count / th
    end
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

  def realised_final_result_count(result)
    final_results(result).count
  end

  def realised_final_result(result)
    frc = final_results(result).count
    th = total_hours
    (frc > 0 and th > 0) ? (frc / th) : 0
  end

  def self.final_results(_selected_result_ids=nil, selected_campaigns=nil)
    res = Result.joins(:campaigns_results).where("is_reported is true").where(:final => true).order("name").select("distinct(results.id), results.*")
    res = res.where(:id => _selected_result_ids) if _selected_result_ids

    if selected_campaigns
      res = res.where("campaigns_results.campaign_id IN (?)", selected_campaigns.map(&:id))
    end
    res.all
  end

  def target_value_per_hour
    currency.from_euro(campaign.euro_production_value_per_hour.to_f)
  end

  def realised_value_per_hour
    if th = total_hours and th.eql?(0.0)
      th
    else
      total_value.to_f / th
    end
  end

  def realised_cost_per_hour
    if th = total_hours and th.eql?(0.0)
      0
    else
      total_cost / th
    end
  end

  def total_number_of_contacts
    campaign.contacts.count
  end

  def contacts_used
    "#{completed_number_of_contacts}-#{total_number_of_contacts}:#{completion_percent.to_i}%"
  end

  def target_db_value
    if vc = target_value_created and vc == 0
      0
    else
      ((vc - target_production_cost) * 100) / vc
    end
  end

  def realised_db_value
    if vc = value_created and vc == 0
      0.0
    else
      ((vc - total_cost) * 100) / vc
    end
  end

  def target_value_created
    if cnc = completed_number_of_contacts and cnc > 0
      (total_number_of_contacts.to_f / cnc) * value_created
    else
      0
    end
  end

  def target_production_cost
    if cnc = completed_number_of_contacts and cnc > 0
      (total_number_of_contacts.to_f / cnc) * total_cost
    else
      0
    end
  end

  def predicted_hours_to_completion
    if cnc = completed_number_of_contacts and cnc > 0
      (total_hours / cnc) * (total_number_of_contacts - completed_number_of_contacts)
    else
      0.0
    end
  end

  def predicted_cost_for_completion
    if completion_percent.to_i == 0
      0
    else
      ((production_cost / completion_percent) * 100) - production_cost
    end
  end

  def predicted_value_for_completion
    if completion_percent.to_i == 0
      0
    else
      ((value_created / completion_percent) * 100) - value_created
    end
  end

  def completed_number_of_contacts
    cc = Contact.with_completed_status(true).joins(:call_results).where("leads.campaign_id = ? and call_results.created_at::DATE BETWEEN ? AND ?",
                                                                  campaign.id, date_from, date_to)
    if selected_users?
      cc = cc.where("call_results.creator_id in (?)", user.map(&:id))
    elsif user
      cc = cc.where("call_results.creator_id = ?", user.id)
    end
    cc.select("distinct(leads.id)").count
  end

  def completion_percent
    campaign.completion.to_f
  end

  def value_created
    currency.from_euro(total_value)
  end

  # EUR
  def leads_sold_total_value
    leads_sold.sum("lead_purchases.euro_price * lead_purchases.quantity").to_f
  end

  def leads_sold_count
    leads_sold.sum("lead_purchases.quantity").to_i
  end

  def hours_used
    total_hours
  end

  # converted
  def production_cost
    total_cost
  end

  # converted
  def target_result
    value_created - production_cost
  end

  # EUR
  def realised_result
    leads_sold_total_value - production_cost
  end

  def number_of_call_results
    all_call_results.count
  end

  def average_number_of_minutes_per_final_result
    if frc = final_results.count and frc.zero?
      "-"
    else
      ((total_hours * 60) / frc).round
    end
  end

  def average_number_of_call_results_per_finished_contact
    if fcc = finished_contacts.count and fcc.zero?
      "-"
    else
      (number_of_call_results.to_f / fcc).round(2)
    end
  end

  def number_of_results_per_minute
    if th = total_hours and th.zero?
      "-"
    else
      (number_of_call_results.to_f / (th * 60)).round(2)
    end
  end

  def self.store_pdf(report_cache, current_user)
    pdf_path = Rails.root.join "public/system/campaign_reports_cache/#{current_user.id}/#{report_cache}.pdf"
    html_path = Rails.root.join "public/system/campaign_reports_cache/#{current_user.id}/#{report_cache}.pdf.html"
    unless File.exists? pdf_path
      `python public/html2pdf/pisa.py #{html_path} #{pdf_path}`
    end
    pdf_path
  end

  def has_results?
    !all_call_results.count.eql?(0)
  end

  def currency
    @currency ||= Currency.find(currency_id)
  end

  def self.human_name
    "Campaign Report"
  end

  def number_of_calls
    call_logs_scope.ringing.count
  end

  def number_of_no_answer
    call_logs_scope.ringing.count - call_logs_scope.talk.count
  end

  def time_between_calls
    call_logs_scope.ringing.join_on_next_with_state('RINGING').next_created_within(60).select("EXTRACT(EPOCH FROM AVG(next_cl.created_at - call_logs.created_at)) as time_between_calls").first.time_between_calls
  end

  def time_on_phone
    call_logs_scope.ringing.join_on_next_with_state('FINISH').select("EXTRACT(EPOCH FROM SUM(next_cl.created_at - call_logs.created_at)) as time_on_phone").first.time_on_phone
  end

  def calls_per_success
    if final_with_success_count = final_results.with_success.count and final_with_success_count.zero?
      "-"
    else
      number_of_calls / final_with_success_count
    end
  end

  def calls_per_final_result
    if final_count = final_results.count and final_count.zero?
      "-"
    else
      number_of_calls / final_count
    end
  end

  private

  def call_logs_scope
    CallLog.for_campaigns(campaign).created_between(date_from, date_to).for_users(Array(user).map(&:id))
  end

  def all_call_results
    crs = CallResult.joins(:result).for_campaign(campaign).where("call_results.created_at::DATE BETWEEN ? AND ?", date_from, date_to).with_reported
    if selected_users?
      crs = crs.where("call_results.creator_id in (?)", user.map(&:id))
    elsif user
      crs = crs.where("call_results.creator_id = ?", user.id)
    end
    selected_result_ids ? crs.where("results.id IN (?)", selected_result_ids) : crs
  end

  def results_scope(type, result)
    rsp = type == :final ? CallResult.final_for_campaign(campaign) : CallResult.temp_for_campaign(campaign)
    rsp = rsp.where("call_results.created_at::DATE BETWEEN ? AND ?", date_from, date_to).with_reported
    if selected_users?
      rsp = rsp.where("call_results.creator_id in (?)", user.map(&:id))
    elsif user
      rsp = rsp.where("call_results.creator_id = ?", user.id)
    end
    rsp = rsp.where("results.id = ?", result.id) if result
    rsp = rsp.where("results.id IN (?)", selected_result_ids) if selected_result_ids
    rsp
  end

  def temp_results(result=nil)
    rsp = results_scope(:temp, result)
    rsp
  end

  def final_results(result=nil)
    rsp = results_scope(:final, result)
    rsp
  end

  def user_session_logs(_user=nil)
    th = campaign.user_session_logs.where("created_at::DATE BETWEEN ? AND ?", date_from, date_to)
    _user = _user || user
    if selected_users?(_user)
      th = th.where("user_id in (?)", _user.map(&:id))
    elsif _user
      th = th.where("user_id = ?", _user.id)
    end
    th
  end

  def total_hours(_user=nil)
    th = user_session_logs(_user || user)
    th.sum(:hours_count).to_f
  end

  # EUR
  def total_billing(_user=nil)
    th = user_session_logs(_user || user)
    th.sum("hours_count * euro_billing_rate").to_f
  end

  def finished_contacts
    fc = Contact.with_completed_status(true).where("leads.campaign_id = ? and campaigns_results.campaign_id = ? and call_results.created_at::DATE BETWEEN ? AND ? and results.final is true and campaigns_results.is_reported is true",
                                                   campaign.id, campaign.id, date_from, date_to).joins(:call_results => [:result => [:campaigns_results]])
    fc = fc.where("results.id IN (?)", selected_result_ids) if selected_result_ids
    if selected_users?
      fc = fc.where("call_results.creator_id in (?)", user.map(&:id))
    elsif user
      fc = fc.where("call_results.creator_id = ?", user.id)
    end
    fc
  end

  # EUR
  def total_value_not_upgraded
    not_upgraded = CallResult.final_for_campaign(campaign).where("results.upgrades_to_lead is false and call_results.created_at::DATE BETWEEN ? AND ?", date_from, date_to).with_reported
    if selected_users?
      not_upgraded = not_upgraded.where("call_results.creator_id in (?)", user.map(&:id))
    elsif user
      not_upgraded = not_upgraded.where("call_results.creator_id = ?", user.id)
    end
    not_upgraded = not_upgraded.where("results.id IN (?)", selected_result_ids) if selected_result_ids
    not_upgraded.with_dynamic_value(false)
  end

  # EUR
  def total_value_not_upgraded_dynamic
    not_upgraded_dynamic = DynamicResultValue.for_campaign(campaign).between_dates(date_from, date_to)
    if selected_users?
      not_upgraded_dynamic = not_upgraded_dynamic.where("creator_id in (?)", user.map(&:id))
    elsif user
      not_upgraded_dynamic = not_upgraded_dynamic.where("creator_id = ?", user.id)
      not_upgraded_dynamic = not_upgraded_dynamic.where("result_id IN (?)", selected_result_ids) if selected_result_ids
    end
    not_upgraded_dynamic
  end

  # EUR
  def total_value_upgraded
    upgraded = CallResult.final_for_campaign(campaign).where("results.upgrades_to_lead is true and call_results.created_at::DATE BETWEEN ? AND ?", date_from, date_to).with_reported.
        joins(:contact => :leads)
    if selected_users?
      upgraded = upgraded.where("call_results.creator_id in (?)", user.map(&:id))
    elsif user
      upgraded = upgraded.where("call_results.creator_id = ?", user.id)
    end
    upgraded = upgraded.where("results.id IN (?)", selected_result_ids) if selected_result_ids
    upgraded
  end

  # EUR
  def total_value_generated_leads_during_upgrade
    upgrade_to_member = Result.where("name = ? and generic IS TRUE", "Upgrade to member").first
    generated_leads = CallResult.final_for_campaign(campaign).where("results.id = ? and call_results.created_at::DATE BETWEEN ? AND ?", upgrade_to_member.id, date_from, date_to).with_reported
    generated_leads = generated_leads.with_leads_from_deals_requested_during_upgrade_to_member
    generated_leads
  end

  def total_value
    not_upgraded = total_value_not_upgraded

    not_upgraded_dynamic = total_value_not_upgraded_dynamic

    upgraded = total_value_upgraded

    generated_leads = total_value_generated_leads_during_upgrade

    currency.from_euro(not_upgraded.sum("call_results.euro_value").to_f + not_upgraded_dynamic.sum("value * euro_value").to_f + upgraded.sum("leads_leads.euro_price").to_f + generated_leads.sum("generated_leads.euro_price").to_f)
  end

  def leads_sold
    sold = CallResult.final_for_campaign(campaign).where("results.upgrades_to_lead is true and call_results.created_at::DATE BETWEEN ? AND ?", date_from, date_to).with_reported.
        joins(:contact => {:leads => [:lead_purchases]})

    if selected_users?
      sold = sold.where("call_results.creator_id in (?)", user.map(&:id))
    elsif user
      sold = sold.where("call_results.creator_id = ?", user.id)
    end
    sold = sold.where("results.id IN (?)", selected_result_ids) if selected_result_ids
    sold
  end

  def total_cost
    currency.from_euro(
      if campaign.cost_type == Campaign::FIXED_COST
        user ?  (campaign.euro_fixed_cost_value / campaign.users.with_results.count) : campaign.euro_fixed_cost_value
      elsif campaign.cost_type == Campaign::FIXED_HOURLY_RATE_COST
        campaign.euro_fixed_cost_value * total_hours
      elsif campaign.cost_type == Campaign::AGENT_BILLING_RATE_COST
        user ? selected_users? ? user.map { |u| u.euro_billing_rate.to_f * total_hours(u)}.sum : (user.euro_billing_rate.to_f * total_hours(user)) : campaign.users.map { |u| total_billing(u) }.sum.to_f
      elsif campaign.cost_type == Campaign::NO_COST
        0.0
      elsif campaign.cost_type == Campaign::PAYOUT
        user ? AgentTimesheet::Payout.for_campaign(campaign).for_users(user).sum(:payout) : AgentTimesheet::Payout.for_campaign(campaign).sum(:payout)
      end
    )
  end

  def self.destroy(filename, current_user)
    begin
      File.delete(Rails.root.join("public/system/campaign_reports_cache/#{current_user.id}/#{filename}.html"))
      File.delete(Rails.root.join("public/system/campaign_reports_cache/#{current_user.id}/#{filename}.pdf"))
    rescue
      "Campaign Report not found!"
    end
  end

end