class SignInController < ApplicationController
  before_filter :redirect_to_root_path_if_signed_in

  def new(user_class_name)
    @user = user_class_name.new(:newsletter_on => true, :time_zone => "UTC")
  end

  def create(user_class_name, param_key, success_notice)
    data = params[:token] ? RPXNow.user_data(params[:token], :raw_response => true)['profile'] : nil
    @user = user_class_name.new(params[param_key])
    @user.set_fields_for_rpx(data) unless data.blank?
    if request.referer.to_s.include?("certification_accounts")
      @user.skip_email_verification = "1"
    end
    respond_to do |format|
      if @user.save
        flash[:notice] = success_notice
        format.html { redirect_to(root_path) }
      else
        format.html { render("new") }
      end
    end
  end

end