class Fixnum
  def to_time(format = '%H:%M:%S')
    start = Time.at(0)
    hours = Time.at(self).gmtime.strftime(format)
    days  = ((Time.at(self) - start)/86400).to_i
    if days.zero?
      hours
    else
      "#{days}d #{hours}"
    end
  end
end
