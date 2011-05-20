class CallCentres::PasswordController < CallCentres::CallCentreController

  before_filter :fetch_user

  private

  def fetch_user
    @user = User.find(params[:call_centre_agent_id])
  end

  public

  def destroy
    @user.send_reset_password_instructions
    flash[:notice] = t("password.flashes.reset")
    redirect_to edit_call_centres_call_centre_agent_path(@user)
  end

  def update
    @user = @user.with_role
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      flash[:notice] = t("password.flashes.successfully_changed")
      redirect_to edit_call_centres_call_centre_agent_path(@user)
    else
      flash[:alert] = t("password.flashes.not_changed")
      render :action => :new
    end
  end
end
