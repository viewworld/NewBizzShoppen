class SignInController < ApplicationController
  before_filter :redirect_to_root_path_if_signed_in

  def new(user_class_name)
    @user = user_class_name.new(:newsletter_on => true, :time_zone => "UTC")
    @user.time_zone = "Copenhagen" if I18n.locale == :da

    if @user.is_a?(User::Member) or @user.is_a?(User::Supplier) or @user.is_a?(User::CategorySupplier)
      free_subscription = SubscriptionPlan.active.for_role(@user.is_a?(User::Member) ? :member : "#{'category_' if @user.is_a?(User::CategorySupplier)}supplier".to_sym).free.first
      @user.subscription_plan_id = free_subscription.id if free_subscription
    end
    data = session[:rpx_data]
    @user.set_fields_for_rpx(data) unless data.blank?
  end

  def create(user_class_name, param_key, success_notice, path = root_path)
    ActiveRecord::Base.transaction do
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
        @user.assign_free_subscription_plan = true
      end

      if @deal = Deal.find_by_id(params[:deal_request_id])
        @lead = Lead.new
        @lead.based_on_deal(@deal, @user)
      end

      respond_to do |format|
        if @user.save
          success_notice = I18n.t("flash.accounts.create.no_verification") if @user.confirmed?

          if ["fairdeals", "fairleads"].include?(session[:site]) and @user.has_any_role?(:member, :category_supplier, :supplier) and @user.confirmed? and @user.rpx_identifier.blank?
            @user.send_invitation_email(params[param_key][:password]) if @user.member?
            path = session[:user_return_to] if session[:user_return_to]
            success_notice = I18n.t("devise.sessions.new.controller.successfully_logged_in")
            sign_in(@user)
          end
          unless @user.rpx_identifier.blank?
            @user.confirm!
            sign_in(@user)
          end

          flash[:notice] = @user.rpx_identifier.blank? ? success_notice : I18n.t("devise.sessions.new.controller.successfully_logged_in")
          format.html { redirect_to(path) }
          format.js {  }
        else
          format.html { render("new") }
          format.js {  }
        end
      end
    end
  end
end
