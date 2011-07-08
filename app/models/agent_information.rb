class AgentInformation

  attr_accessor :date_from, :date_to, :user

  def initialize(date_from, date_to, user)
    self.date_from = date_from.to_date
    self.date_to = date_to.to_date
    self.user = user
  end

  def value_created
    ActiveRecord::Base.connection.select_rows(%{
      SELECT sum(sum)
      FROM agent_information
      WHERE created_at BETWEEN '#{date_from}' AND '#{date_to}' AND user_id = #{user.id}
      GROUP BY user_id
    }).flatten.first.to_f
  end

  def self.today(user)
    new(Date.today,Date.today, user)
  end

  def self.week(user)
    new(Time.now.beginning_of_week.to_date, Time.now.end_of_week.to_date, user)
  end

  def self.quarter(user)
    new(Time.now.beginning_of_quarter.to_date, Time.now.end_of_quarter.to_date, user)
  end

  def self.year(user)
    new(Time.now.beginning_of_year.to_date, Time.now.end_of_year.to_date, user)
  end

end