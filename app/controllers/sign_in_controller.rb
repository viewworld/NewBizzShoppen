class SignInController < ApplicationController
  before_filter :redirect_to_root_path_if_signed_in

  def new(user_class_name)
    @user = user_class_name.new(:newsletter_on => true, :time_zone => "UTC")
    data = session[:rpx_data]
    @user.set_fields_for_rpx(data) unless data.blank?
  end

  def create(user_class_name, param_key, success_notice, path = root_path)
    data = params[:token] ? RPXNow.user_data(params[:token], :raw_response => true)['profile'] : nil
    data = session[:rpx_data] if data.blank?
    user = User.find_by_email(data['verifiedEmail']) unless data.blank?
    if user
      user.update_attribute(:rpx_identifier, data['identifier'])
      flash[:notice] = t("devise.sessions.new.controller.successfully_connect_to_social", :first_name => user.first_name, :account_type => User.social_provider(user.rpx_identifier), :email => user.email)
      sign_in(user)
      if user.has_role? :category_supplier and user.sign_in_count == 1
        return redirect_to my_profile_path
      else
        return redirect_to root_path
      end
    end
    @user = user_class_name.new(params[param_key])
    @user.set_fields_for_rpx(data) unless data.blank?
    if request.referer.to_s.include?("certification_accounts")
      @user.skip_email_verification = "1"
    end

    respond_to do |format|
      if @user.save
        if session[:site] == "fairdeals" and @user.has_role?(:purchase_manager) and @user.confirmed? and @user.rpx_identifier.blank?
          @user.send_invitation_email(params[param_key][:password])
          path = session[:user_return_to] if session[:user_return_to]
          sign_in(@user)
        end
        unless @user.rpx_identifier.blank?
          @user.confirm!
          sign_in(@user)
        end
        success_notice = I18n.t("flash.accounts.create.no_verification") if @user.confirmed?
        flash[:notice] = @user.rpx_identifier.blank? ? success_notice : "Your account has been successfully created! You are now log in."
        format.html { redirect_to(path) }
      else
        format.html { render("new") }
      end
    end
  end

end