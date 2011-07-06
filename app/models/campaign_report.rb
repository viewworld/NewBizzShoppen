class CampaignReport

  attr_accessor :campaign, :date_from, :date_to, :user

  def initialize(campaign, date_from, date_to, user=nil)
    self.campaign = campaign
    self.date_from = date_from-1
    self.date_to = date_to+1
    self.user = user
  end

  def target_success_percent
    campaign.success_rate
  end

  def realised_success_percent
    (final_results.with_success.count.to_f / final_results.count) * 100
  end

  def target_finished_contacts_per_hour
    campaign.finished_contacts_per_hour
  end

  def realised_finished_contacts_per_hour
    finished_contacts.count / total_hours
  end

  def target_final_result(result)
    cresult = campaign.campaigns_results.joins(:result).where("results.id = ?", result.id).first
    cresult.nil? ? 0 : cresult.expected_completed_per_hour.to_f / total_hours
  end

  def realised_final_result(result)
    final_results(result).count / total_hours
  end

  def self.final_results
    Result.where(:final => true, :is_reported => true).order("name")
  end

  def target_value_per_hour
    campaign.euro_production_value_per_hour
  end

  def realised_value_per_hour
    total_value.to_f / total_hours
  end

  def total_number_of_contacts
    campaign.contacts.count
  end

  def completed_number_of_contacts
    Contact.with_completed_status(true).where("campaign_id = ?", campaign.id).select("distinct(leads.id)").count
  end

  def completion_percent
    campaign.completion
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


  private

  def final_results(result=nil)
    rsp = CallResult.final_for_campaign(campaign).where("call_results.created_at BETWEEN ? AND ?", date_from, date_to).with_reported
    rsp = rsp.where("call_results.creator_id = ?", user.id) if user
    rsp = rsp.where("results.id = ?", result.id) if result
    rsp
  end

  def total_hours
    th = campaign.user_session_logs.where("created_at BETWEEN ? AND ?", date_from, date_to)
    th = th.where("user_id = ?", user.id) if user
    th.sum(:hours_count).to_f
  end

  def finished_contacts
    fc = Contact.with_completed_status(true).where("campaign_id = ? and call_results.created_at BETWEEN ? AND ? and results.final is true and results.is_reported is true", campaign.id, date_from, date_to).
        joins(:call_results => [:result])
    fc = fc.where("call_results.creator_id = ?", user.id) if user
    fc
  end

  def total_value
    not_upgraded = CallResult.final_for_campaign(campaign).where("results.upgrades_to_lead is false and call_results.created_at BETWEEN ? AND ?", date_from, date_to).with_reported
    not_upgraded = not_upgraded.where("call_results.creator_id = ?", user.id) if user

    upgraded = CallResult.final_for_campaign(campaign).where("results.upgrades_to_lead is true and call_results.created_at BETWEEN ? AND ?", date_from, date_to).with_reported.
        joins(:contact => :lead)
    upgraded = upgraded.where("call_results.creator_id = ?", user.id) if user

    not_upgraded.sum("campaigns_results.euro_value").to_f + upgraded.sum("leads_leads.euro_price").to_f
  end

  def leads_sold
    sold = CallResult.final_for_campaign(campaign).where("results.upgrades_to_lead is true and call_results.created_at BETWEEN ? AND ?", date_from, date_to).with_reported.
        joins(:contact => {:lead => [:lead_purchases]})
    sold = sold.where("call_results.creator_id = ?", user.id) if user
    sold
  end

  def total_cost
    if campaign.cost_type == Campaign::FIXED_COST
      euro_fixed_cost_value
    elsif campaign.cost_type == Campaign::FIXED_HOURLY_RATE_COST
      euro_fixed_cost_value * total_hours
    elsif campaign.cost_type == Campaign::AGENT_BILLING_RATE_COST
      campaign.users.with_agents_without_call_centres.map { |u| u.euro_billing_rate * total_hours }.sum
    elsif campaign.cost_type == Campaign::NO_COST
      0.0
    end
  end
end