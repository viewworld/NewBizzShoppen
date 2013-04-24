class Callers::CallLogsController < Callers::CallerController

  def create
    @call_log = CallLog.create(params[:call_log])
    render :nothing => true
  end

end