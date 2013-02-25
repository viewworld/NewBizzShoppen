class AgentPerformance

  attr_accessor :date_from, :date_to, :user, :campaign

  def initialize(date_from, date_to, user, campaign)
    self.date_from = (date_from||Date.today).to_date
    self.date_to = (date_to||Date.today).to_date
    self.user = user
    self.campaign = campaign
  end

  def time
    @time ||= UserSessionLog.for_campaign(campaign).campaign_type.for_user(user).started_between(date_from, date_to+1.day).sum(:hours_count)
  end

  def payout
    @payout ||= AgentTimesheetsPayout.for_campaign(campaign).for_user(user).created_between(date_from, date_to+1.day).sum(:euro_payout)
  end

  def rate
    time > 0 ? payout / time : 0
  end

  # helper initializers

  def self.today(user, campaign)
    new(Date.today,Date.today, user, campaign)
  end

  def self.this_week(user, campaign)
    new(Time.now.beginning_of_week.to_date, Time.now.end_of_week.to_date, user, campaign)
  end

  def self.this_month(user, campaign)
    new((Time.now.beginning_of_month).to_date, Time.now.end_of_month.to_date, user, campaign)
  end

  def self.this_quarter(user, campaign)
    new(Time.now.beginning_of_quarter.to_date, Time.now.end_of_quarter.to_date, user, campaign)
  end

  def self.this_year(user, campaign)
    new(Time.now.beginning_of_year.to_date, Time.now.end_of_year.to_date, user, campaign)
  end

end