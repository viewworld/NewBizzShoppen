class Callers::UserSessionLogsController < Callers::CallerController
  inherit_resources

  set_tab 'reports'
  set_subtab 'user_session_logs'

  def collection
    @search = UserSessionLog.scoped_search((params[:search] || {}).merge(:with_hours => '1'))
    @user_session_logs = @search.order("created_at DESC")
    @user_session_logs_paginated = @user_session_logs.paginate(:page => params[:page], :per_page => 30, :show_all => params[:show_all])
    @user_session_logs_paginated = UserSessionLogDecorator.decorate(@user_session_logs_paginated)
    @total_hours = @user_session_logs.sum(:hours_count).to_f
  end

end
