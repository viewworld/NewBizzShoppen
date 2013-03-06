class TopAgent

  attr_accessor :date_from, :date_to, :user_id, :value, :user, :currency

  def initialize(date_from, date_to, currency)
    self.date_from = date_from
    self.date_to = date_to
    self.user_id, self.value = top_agent
    self.user = User.find_by_id(user_id).with_role if user_id
    self.currency = currency
  end

  def valid?
    user.present?
  end

  def self.today(currency)
    new(Date.today,Date.today, currency)
  end

  def self.value_for(symbol, currency)
    if ta = TopAgent.send(symbol, currency) and ta.valid?
      ta.value_created
    else
      0.0
    end
  end

  def self.week(currency)
    new(Time.now.beginning_of_week.to_date, Time.now.end_of_week.to_date, currency)
  end

  def self.quarter(currency)
    new(Time.now.beginning_of_quarter.to_date, Time.now.end_of_quarter.to_date, currency)
  end

  def self.year(currency)
    new(Time.now.beginning_of_year.to_date, Time.now.end_of_year.to_date, currency)
  end

  def value_created
    currency.from_euro(self.value.to_f)
  end

  def top_agent
    ActiveRecord::Base.connection.select_rows(%{
      SELECT user_id, sum(sum)
      FROM agent_information
      WHERE created_at::DATE BETWEEN '#{date_from}' AND '#{date_to}'
      GROUP BY user_id
      ORDER BY sum DESC
      LIMIT 1
    }).flatten
  end



end