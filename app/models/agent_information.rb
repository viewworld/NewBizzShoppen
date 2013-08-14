class AgentInformation

  attr_accessor :date_from, :date_to, :user, :currency

  def initialize(date_from, date_to, user, currency)
    self.date_from = date_from.to_date
    self.date_to = date_to.to_date
    self.user = user
    self.currency = currency
  end

  def value_created
    currency.from_euro(
      ActiveRecord::Base.connection.select_rows(%{
        SELECT sum(sum)
        FROM agent_information
        WHERE created_at::DATE BETWEEN '#{date_from}' AND '#{date_to}' AND user_id = #{user.id}
        GROUP BY user_id
      }).flatten.first.to_f
    )
  end

  def time
    UserSessionLog.campaign_type.for_user(user).started_between(date_from, date_to).sum(:hours_count)
  end

  def number_of_calls
    AgentTimesheet::Calls.with_date_between(date_from, date_to).for_agent(user).sum(:calls)
  end

  def time_on_phone
    AgentTimesheet::TimeOnPhone.with_date_between(date_from, date_to).for_agent(user).sum(:time_on_phone) / 3600.0
  end

  def payout
    AgentTimesheet::Payout.with_date_between(date_from, date_to).for_agent(user).sum(:payout)
  end

  # helper initializers

  def self.today(user, currency = Currency.dkk)
    new(Date.today,Date.today, user, currency)
  end

  def self.week(user, currency = Currency.dkk)
    new(Time.now.beginning_of_week.to_date, Time.now.end_of_week.to_date, user, currency)
  end

  def self.last_four_weeks(user, currency = Currency.dkk)
    new((Time.now.beginning_of_week-3.weeks).to_date, Time.now.end_of_week.to_date, user, currency)
  end

  def self.quarter(user, currency = Currency.dkk)
    new(Time.now.beginning_of_quarter.to_date, Time.now.end_of_quarter.to_date, user, currency)
  end

  def self.year(user, currency = Currency.dkk)
    new(Time.now.beginning_of_year.to_date, Time.now.end_of_year.to_date, user, currency)
  end

end