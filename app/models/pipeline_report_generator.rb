class PipelineReportGenerator
  attr_reader :user, :order, :report_lines
  attr_accessor :currency

  def initialize(user, order)
    @user = user
    @order = order
    @currency = user.pipeline_report_currency ||= Currency.euro
    @report_lines = user.pipeline_reports.order(order_by_state? ? 'state, year, week, header' : "year, #{order}, header")
  end

  def result
    [].tap do |result|
      titles.each do |title|
        lines = lines(title)
        result << {:title => title_for_display(title),
                   :lines => lines_to_array_of_hash(lines),
                   :value_sum => to_users_currency(lines.sum(&:euro_value)),
                   :pipeline_value_sum => to_users_currency(lines.sum(&:euro_pipeline_value))}
      end
    end
  end

  private

  def lines(title)
    order_by_state? ? lines_for_order_state(title) : lines_for_week_or_month_state(title)
  end

  def lines_for_order_state(title)
    report_lines.select { |report_line| report_line.state == title }
  end

  def lines_for_week_or_month_state(title)
    title_array = title.split(', ')
    report_lines.select { |report_line| report_line.year == title_array.last.to_i && report_line.send(order) == title_array.first.to_i }
  end

  def lines_to_array_of_hash(lines)
    lines.map do |line|
      {:company_name => line.company_name,
       :lead_header => line.header,
       :contact_name => line.contact_name,
       :decision_date => line.decision_date,
       :state => line.state_for_display,
       :value => line.euro_value_for_currency(currency),
       :estimate => line.estimate,
       :pipeline_value => line.euro_pipeline_value_for_currency(currency)}
    end
  end

  def order_by_state?
    @order_by_state ||= order == 'state'
  end

  def titles
    @titles ||= report_lines.map { |report_line| title_from_report_line(report_line) }.uniq
  end

  def title_for_display(title)
    order_by_state? ? I18n.t("lead_purchases.statuses.#{LeadPurchase::STATUSES[title]}") : "#{order}: #{title}"
  end

  def title_from_report_line(report_line)
    order_by_state? ? report_line.state : "#{report_line.send(order)}, #{report_line.year}"
  end

  def to_users_currency(number)
    currency.from_euro(number)
  end
end
