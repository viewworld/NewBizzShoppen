class LoginKeysController < ApplicationController

  def index
    if !current_user and params[:key].present?
      user = User.find_by_login_key(params[:key])
      sign_in(user) if user
    end
    redirect_to root_path
  end
end