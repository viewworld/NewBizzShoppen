class MyProfileController < SecuredController
  inherit_resources
  actions :all, :except => [:update]
  before_filter :redirect_if_my_profile_hidden

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

  def social_link
    data = params[:token] ? RPXNow.user_data(params[:token], :raw_response => true)['profile'] : nil
    unless data[:identifier].blank?
      current_user.update_attribute(:rpx_identifier, data[:identifier])
      flash[:notice] = "Your account is now connected to #{User.social_provider(current_user.rpx_identifier)}"
    end
    redirect_to my_profile_path
  end

  def social_unlink
    current_user.update_attribute(:rpx_identifier, nil)
    flash[:notice] = "Your account is no longer connected to any of social media services."
    redirect_to my_profile_path
  end

  protected

  def redirect_if_my_profile_hidden
    if current_user and current_user.hide_profile_page?
      redirect_to root_path
    end
  end
end
