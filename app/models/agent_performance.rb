class AgentPerformance

  attr_accessor :date_from, :date_to, :user, :campaigns, :currency

  def initialize(date_from, date_to, user, campaign, currency_id)
    self.date_from = (date_from||Date.today.beginning_of_week).to_date
    self.date_to = (date_to||Date.today.end_of_week).to_date
    self.user = Array(user).map(&:with_role)
    self.campaigns = Array(campaign).map(&:id)
    self.currency = Currency.find_by_id(currency_id) || Currency.euro
  end

  def time
    @time ||= user_session_logs.sum(:hours_count)
  end

  def payout
    @payout ||= currency.from_euro(payouts.sum(:payout))
  end

  def value
    @value ||= currency.from_euro(values.sum(:value))
  end

  def rate
    time > 0 ? payout / time : 0
  end

  def result_count
    results.sum(:results)
  end

  def call_count
    calls.sum(:calls)
  end

  def time_on_phone
    time_on_phones.sum(:time_on_phone)/3600.0
  end

  def flot_chart
    if (date_to+1-date_from).to_i > 31
      flot_months
    else
      flot_days
    end
  end

  def flot_days
    {
        :hours => user_session_logs.select("end_date, sum(hours_count) as hours").group("end_date").reorder("end_date").map{|usl| [usl.end_date.to_time.to_i*1000, usl.hours]},
        :payout => payouts.select("created_at, sum(payout) as payout").group("created_at").reorder("created_at").map{|usl| [(usl.created_at.to_time.to_i+jitter)*1000, currency.from_euro(usl.payout)]},
    }
  end

  def flot_months
    flot_days
  end

  def has_any_data?
    time.nonzero? or payout.nonzero?
  end

  def show_results?(active_results)
    if ActiveRecord::ConnectionAdapters::Column.value_to_boolean(active_results)
      has_any_data?
    else
      true
    end
  end

  private

  def jitter
    60*60*8 # 10 hours
  end

  def user_session_logs
    @user_session_logs ||= UserSessionLog.for_campaigns(campaigns).campaign_type.for_users(user).started_between(date_from, date_to)
  end

  def payouts
    @payouts ||= AgentTimesheet::Payout.for_campaigns(campaigns).for_users(user).created_between(date_from, date_to)
  end

  def values
    @values ||= ::AgentTimesheet::Value.for_campaigns(campaigns).for_users(user).created_between(date_from, date_to)
  end

  def results
    @results ||= AgentTimesheet::Results.for_campaigns(campaigns).for_users(user).created_between(date_from, date_to)
  end

  def calls
    @calls ||= AgentTimesheet::Calls.for_campaigns(campaigns).for_users(user).created_between(date_from, date_to)
  end

  def time_on_phones
    @time_on_phones ||= ::AgentTimesheet::TimeOnPhone.for_campaigns(campaigns).for_users(user).created_between(date_from, date_to)
  end

  public

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