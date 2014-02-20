class LoginTimeRequestGenerator
  attr_accessor :login_time_request
  delegate :campaign_id,
           :creator_id,
           :user_id,
           :valid?,
           :whole_day?,
           :whole_day_start_time,
           :whole_day_end_time,
           :whole_day_start_date,
           :whole_day_end_date, :to => :login_time_request
  attr_reader :date_rage
  private :date_rage,
          :campaign_id,
          :creator_id,
          :user_id,
          :valid?,
          :whole_day?,
          :whole_day_start_time,
          :whole_day_end_time,
          :whole_day_start_date,
          :whole_day_end_date

  def initialize(params)
    @login_time_request = LoginTimeRequest.new(params)
  end

  def save
    valid? ? create_login_time_requests : false
  end

  private

  def create_login_time_requests
    whole_day? ? create_login_time_requests_for_whole_day : login_time_request.save
  end

  def create_login_time_requests_for_whole_day
    date_range.each do |date|
      date_as_string = date.strftime(LoginTimeRequest::DATE_FORMAT)
      LoginTimeRequest.create(config("#{date_as_string} #{whole_day_start_time}",
                                     "#{date_as_string} #{whole_day_end_time}"))
    end
    true
  end

  def date_range
    (Date.parse(whole_day_start_date)..Date.parse(whole_day_end_date)).to_a
  end

  def config(start_time, end_time)
    {:campaign_id => campaign_id,
     :creator_id => creator_id,
     :end_time => Time.zone.parse(end_time),
     :start_time => Time.zone.parse(start_time),
     :user_id => user_id,
     :whole_day => '0'}
  end
end
