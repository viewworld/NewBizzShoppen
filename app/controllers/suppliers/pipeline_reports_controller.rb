class Suppliers::PipelineReportsController < Suppliers::AdvancedSupplierController
  before_filter :check_if_pipeline_reports_enabled

  def index
    pipeline_report = PipelineReportGenerator.new(current_user, params[:order])
    @result = pipeline_report.result
    @currency = pipeline_report.currency
  end

  private

  def check_if_pipeline_reports_enabled
    redirect_to suppliers_root_path unless current_user.pipeline_reports_enabled?
  end
end
