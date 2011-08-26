class LoginKeysController < ApplicationController

  def index
    if !current_user and params[:key].present?
      user = User.find_by_login_key(params[:key])
      if user
        sign_in(user)
        user.clear_login_key!
      end
    end
    redirect_to root_path
  end
end