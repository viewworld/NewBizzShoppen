class CWeek

  include Comparable

  attr :date

  def initialize(week = nil, year = nil)
    @date = Date.commercial(
        year || Date.today.year,
        week || Date.today.cweek,
        1
    )
  end

  def self.first(year = nil)
    CWeek.new(1, year || Date.today.year)
  end

  def self.last(year = nil)
    CWeek.new(52, year || Date.today.year)
  end

  def <=>(other)
    @date <=> other.date
  end

  def succ
    next_week = @date + 1.week
    CWeek.new(next_week.cweek, next_week.year)
  end

  def cweek
    @date.cweek
  end

  def year
    [@date.beginning_of_week.year, @date.end_of_week.year].uniq
  end

  def inspect
    "#{cweek}/#{year.last}"
  end

  def to_s
    cweek
  end

  def days(weekends = true)

  end

end