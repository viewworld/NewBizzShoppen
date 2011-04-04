class Administration::PasswordController < Administration::AdministrationController

  before_filter :fetch_user

  private

  def fetch_user
    @user = User.find(params[:user_id])
  end

  public

  def destroy
    @user.send_reset_password_instructions
    flash[:notice] = t("administration.password.destroy.flash.password_reset_successful")
    redirect_to edit_administration_user_path(@user)
  end

  def update
    @user = @user.with_role
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      flash[:notice] = t("password.flashes.successfully_changed")
      redirect_to edit_administration_user_path(@user)
    else
      flash[:alert] = t("password.flashes.not_changed")
      render :action => :new
    end
  end
end
