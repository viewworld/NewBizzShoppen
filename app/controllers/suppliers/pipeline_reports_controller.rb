class Suppliers::PipelineReportsController < Suppliers::AdvancedSupplierController
  before_filter :check_if_pipeline_reports_enabled

  def index
    @pipeline_report = PipelineReportGenerator.new(current_user, params[:order])
    respond_to do |format|
      format.html
      format.pdf { send_file PipelineReportPdf.new(current_user, @pipeline_report).to_file, :type => 'application/pdf' }
    end
  end

  private

  def check_if_pipeline_reports_enabled
    redirect_to suppliers_root_path unless current_user.pipeline_reports_enabled?
  end
end
