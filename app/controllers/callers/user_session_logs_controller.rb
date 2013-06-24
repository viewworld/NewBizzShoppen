class Callers::UserSessionLogsController < Callers::CallerController
  inherit_resources

  set_tab 'reports'
  set_subtab 'user_session_logs'

  def collection
    @search = UserSessionLog.campaign_type.scoped_search(params[:search])
    @user_session_logs = @search.order("created_at DESC").campaign_type
    @user_session_logs_paginated = @user_session_logs.paginate(:page => params[:page], :per_page => 30, :show_all => params[:show_all])
  end

end