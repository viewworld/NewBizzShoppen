class DateCalculator

  FORMAT = "%d.%m"

  class << self

    def days_or_ranges(date_from, date_to, number)
      number_of_days = (date_from - date_to).to_i.abs
      result = []
      if number_of_days <= number
        (number_of_days+1).times { |n| result << (date_from + n.days) }
      elsif (number_of_days / 7) <= number
        recursion(result, date_from, date_to, :week)
      else
        recursion(result, date_from, date_to, :month)
      end
      result
    end

    def recursion(result, date_from, date_to, period)
      result << ((date_from.send("end_of_#{period}") >= date_to) ? date_from..date_to : date_from..date_from.send("end_of_#{period}"))
      date_from.send("end_of_#{period}") < date_to ? recursion(result, date_from.send("end_of_#{period}")+1.day, date_to, period) : result
    end

  end

end