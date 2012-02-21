class LoginKeysController < ApplicationController

  def index
    if !current_user and params[:key].present?
      user = User.find_by_login_key(params[:key])
      if user
        sign_in(user)
      end
    end
    redirect_to params[:redirect] ? params[:redirect] : root_path
  end
end