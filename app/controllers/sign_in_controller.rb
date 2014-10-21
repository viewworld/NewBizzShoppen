class SignInController < ApplicationController
  before_filter :redirect_to_root_path_if_signed_in

  def new(user_class_name)
    @user = user_class_name.new(:newsletter_on => true, :time_zone => "UTC")
    @user.time_zone = "Copenhagen" if I18n.locale == :da

    if @user.is_a?(User::Member) or @user.is_a?(User::Supplier) or @user.is_a?(User::CategorySupplier)
      free_subscription = SubscriptionPlan.active.for_role(@user.is_a?(User::Member) ? :member : "#{'category_' if @user.is_a?(User::CategorySupplier)}supplier".to_sym).free.first
      @user.subscription_plan_id = free_subscription.id if free_subscription
    end
  end

  def create(user_class_name, param_key, success_notice, path = root_path)
    @user = user_class_name.new(params[param_key])
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

        if ["fairdeals", "fairleads"].include?(session[:site]) && @user.has_any_role?(:member, :category_supplier, :supplier) && @user.confirmed?
          @user.send_invitation_email(params[param_key][:password]) if @user.member?
          path = session[:user_return_to] if session[:user_return_to]
          success_notice = I18n.t("devise.sessions.new.controller.successfully_logged_in")
          sign_in(@user)
        end

        flash[:notice] = success_notice
        format.html { redirect_to(path) }
        format.js {  }
      else
        format.html { render("new") }
        format.js {  }
      end
    end
  end

end
