class Administration::PasswordController < ApplicationController

  def destroy
    @user = User.find(params[:user_id])
    @user.send_reset_password_instructions
    flash[:notice] = "Password has been reset"
    redirect_to edit_administration_user_path(@user)
  end
end
