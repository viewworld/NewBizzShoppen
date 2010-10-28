class PasswordController < SecuredController
  inherit_resources

  def resource
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_with_password(params["user_#{current_user.role}".to_sym])
      flash[:notice] = I18n.t("password.update.controller.successful_update_notice")
      redirect_to password_path
    else
      render 'edit'
    end
  end

end
