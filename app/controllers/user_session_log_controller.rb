class UserSessionLogController < ApplicationController
  def create
    @user_session_log = UserSessionLog.find_by_id(session[:current_usl_global])
  end
end