class UserSessionLogController < ApplicationController
  def create
    @user_session_log = UserSessionLog.active_regular_for_user(current_user).first

    respond_to do |format|
      format.js
      format.html
    end
  end
end
