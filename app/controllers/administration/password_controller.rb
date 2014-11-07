class Administration::PasswordController < Administration::AdministrationController
  before_filter :set_user

  def update
    @user = @user.with_role
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      redirect_to edit_administration_user_path(@user), notice: t('password.flashes.successfully_changed')
    else
      flash[:alert] = t('password.flashes.not_changed')
      render :new
    end
  end

  def destroy
    @user.send_reset_password_instructions
    redirect_to edit_administration_user_path(@user), notice: t('administration.password.destroy.flash.password_reset_successful')
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
