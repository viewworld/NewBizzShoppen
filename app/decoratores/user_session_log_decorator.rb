class UserSessionLogDecorator < ApplicationDecorator
  decorates :user_session_log
  allows :user_screen_name, :campaign

  def hours
    model.hours_count.to_f.as_hours_and_minutes
  end

  def start_time
    h.l model.start_time.in_time_zone(model.time_zone)
  end

  def end_time
    h.l model.end_time.in_time_zone(model.time_zone)
  end

  def log_type
    model.regular? ? 'Regular' : 'Campaign'
  end

  def percentage_of_hours(total_hours)
    h.number_with_precision(model.percentage_of_hours(total_hours), :precision => 3) + "%"
  end

end
