class MyProfileController < SecuredController
  inherit_resources
  actions :all, :except => [:update]

  def resource
    @user = default_user_class_instance
  end

  def update
    @user = default_user_class_instance
    if @user.update_attributes(params["user_#{@user.role.to_s}".to_sym])
      flash[:notice] = I18n.t("my_profile.update.controller.successful_update_notice")
      redirect_to my_profile_path
    else
      render :action => 'edit'
    end
  end

  private

  def default_user_class_instance
    "User::#{current_user.role.to_s.camelize}".constantize.find(current_user.id)
  end
end
