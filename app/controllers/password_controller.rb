class PasswordController < ApplicationController
  inherit_resources

  def resource
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_with_password(params[:user])
      flash[:notice] = I18n.t("password.controller.update.successful_update_notice")
      redirect_to password_path
    else
      render 'edit'
    end
  end
end
