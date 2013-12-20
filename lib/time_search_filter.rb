class TimeSearchFilter
  DEFAULT_FORMAT = '%d-%m-%Y %H:%M'
  FORMAT_YYYY_MM_DD = '%Y-%m-%d'

  ALLOWED_FILTERS = [
    :yesterday,
    :today,
    :this_week,
    :this_month,
    :this_quarter,
    :this_year,
    :all
  ]

  def self.get_filter_data(opts = {})
    opts[:format] ||= DEFAULT_FORMAT
    h = {'data-search' => true}
    values = {}
    # take values from predefined filter if specified
    values = builder_filter_by_name(opts[:filter]) if opts[:filter]
    # take explicit values if specified (also overrides predefined filter)
    values[:from] = opts[:from] if opts[:from]
    values[:to] = opts[:to] if opts[:to]
    h["data-search-attr-#{opts[:field_id_from]}"] = format_value(values[:from], opts[:format]).to_s if opts[:field_id_from]
    h["data-search-attr-#{opts[:field_id_to]}"] = format_value(values[:to], opts[:format]).to_s if opts[:field_id_to]
    h["data-search-after-filter"] = opts[:after_filter].to_s if opts[:after_filter]
    if opts[:submit_function]
      h["data-search-submit-function"] = opts[:submit_function]
    else
      h["data-search-submit"] = true if opts[:submit]
    end
    h
  end

  def self.filter_yesterday
    build_filter(Date.yesterday.beginning_of_day, Date.yesterday.end_of_day)
  end

  def self.filter_today
    build_filter(Time.now.beginning_of_day, Time.now.end_of_day)
  end

  def self.filter_this_week
    build_filter(Time.now.beginning_of_week, Time.now.end_of_week)
  end

  def self.filter_this_month
    build_filter(Time.now.beginning_of_month, Time.now.end_of_month)
  end

  def self.filter_this_quarter
    build_filter(Time.now.beginning_of_quarter, Time.now.end_of_quarter)
  end

  def self.filter_this_year
    build_filter(Time.now.beginning_of_year, Time.now.end_of_year)
  end

  def self.filter_all
    build_filter(nil, nil)
  end

  def self.builder_filter_by_name(filter)
    if ALLOWED_FILTERS.include?(filter)
      send("filter_#{filter}")
    else
      raise ArgumentError, "Filter: #{filter} not allowed or not specified"
    end
  end

  def self.format_value(value, format)
    value.strftime(format) if value
  end

  def self.build_filter(time_from, time_to)
    {
      :from => time_from,
      :to => time_to
    }
  end
end
