class UserSessionLogController < ApplicationController
  def create
    @user_session_log = UserSessionLog.active_regular_for_user.first
  end
end