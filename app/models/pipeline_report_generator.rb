class PipelineReportGenerator
  attr_reader :user, :order, :report_lines

  def initialize(user, order)
    @user = user
    @order = order
    @report_lines = user.pipeline_reports.order(order_by_state? ? 'state, year, week, header' : "year, #{order}, header")
  end

  def result
    [].tap do |result|
      titles.each do |title|
        lines = lines(title)
        result << {
            :title => title,
            :lines => lines,
            :euro_value_sum => lines.sum(&:euro_value),
            :euro_pipeline_value_sum => lines.sum(&:euro_pipeline_value)
        }
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

  def order_by_state?
    @order_by_state ||= order == 'state'
  end

  def titles
    @titles ||= report_lines.map { |report_line| title(report_line) }.uniq
  end

  def title(report_line)
    order_by_state? ? report_line.state : "#{report_line.send(order)}, #{report_line.year}"
  end
end
