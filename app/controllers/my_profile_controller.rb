class MyProfileController < ApplicationController
  inherit_resources
  actions :all, :except => [  :update ]

  def resource
    @user = "User::#{current_user.role.to_s.camelize}".constantize.find(current_user.id)
  end

  def update
    @user = "User::#{current_user.role.to_s.camelize}".constantize.find(current_user.id)
    if @user.update_attributes(params["user_#{@user.role.to_s}".to_sym])
      flash[:notice] = I18n.t("my_profile.update.controller.successful_update_notice")
      redirect_to my_profile_path
    else
      render :action => 'edit'
    end
  end
end
