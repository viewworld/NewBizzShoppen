class Administration::PasswordController < Administration::AdministrationController

  def destroy
    @user = User.find(params[:user_id])
    @user.send_reset_password_instructions
    flash[:notice] = t("administration.password.destroy.flash.password_reset_successful")
    redirect_to edit_administration_user_path(@user)
  end
end
