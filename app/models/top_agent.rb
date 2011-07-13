class TopAgent

  attr_accessor :date_from, :date_to, :user_id, :value, :user

  def initialize(date_from, date_to)
    self.date_from = date_from
    self.date_to = date_to
    self.user_id, self.value = top_agent
    self.user = User.find_by_id(user_id).with_role if user_id
  end

  def valid?
    user.present?
  end

  def self.today
    new(Date.today,Date.today)
  end

  def self.week
    new(Time.now.beginning_of_week.to_date, Time.now.end_of_week.to_date)
  end

  def self.quarter
    new(Time.now.beginning_of_quarter.to_date, Time.now.end_of_quarter.to_date)
  end

  def self.year
    new(Time.now.beginning_of_year.to_date, Time.now.end_of_year.to_date)
  end

  def value_created
    self.value.to_f
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