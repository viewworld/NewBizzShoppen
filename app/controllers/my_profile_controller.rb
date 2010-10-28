class MyProfileController < SecuredController
  inherit_resources
  actions :all, :except => [:update]

  def resource
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params["user_#{@user.role.to_s}".to_sym])
      flash[:notice] = I18n.t("my_profile.update.controller.successful_update_notice")
      redirect_to my_profile_path
    else
      render :action => 'edit'
    end
  end
end
