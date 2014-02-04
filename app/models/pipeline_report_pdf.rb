class PipelineReportPdf
  attr_reader :current_user, :pipeline_report_result, :pipeline_report_currency
  private :current_user, :pipeline_report_result, :pipeline_report_currency

  def initialize(current_user, pipeline_report_generator)
    @current_user = current_user
    @pipeline_report_result = pipeline_report_generator.result
    @pipeline_report_currency = pipeline_report_generator.currency
  end

  def to_file
    File.open(temp_file, 'w') { |f| f.write(output) }
    `python public/html2pdf/pisa.py #{temp_file} #{file}`
    File.delete(temp_file)
    file
  end

  private

  def output
    Invoice::MARKUP_SCAFFOLD % html_markup
  end

  def action_view
    action_view = ActionView::Base.new
    action_view.instance_eval do
      extend InvoiceHelper
      extend ApplicationHelper
    end
  end

  def html_markup
    action_view.render(:inline => template,
                       :type => :erb,
                       :layout => '/app/views/layouts/pdf',
                       :locals => {:result => pipeline_report_result,
                                   :currency => pipeline_report_currency})
  end

  def file_name
    @file_name ||= "pipeline_report_#{current_user.id}_#{Time.now.strftime('%Y%m%d%H%M%S')}"
  end

  def temp_file
    Rails.root.join("public/system/#{file_name}.html")
  end

  def file
    Rails.root.join("public/system/pipeline_report_cache/#{file_name}.pdf")
  end

  def template
    @template ||= File.open(template_file) { |file| file.read }
  end

  def template_file
    Rails.root.join('app/views/suppliers/pipeline_reports/_pipeline_report.html.erb')
  end
end
