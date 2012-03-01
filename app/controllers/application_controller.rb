class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :redirect_to_correct_site
  before_filter :authorize_with_http_basic_for_staging, :check_category_supplier, :update_log_entries, :set_user_time_zone
  before_filter :prepare_search, :if => proc{session[:site]=="fairdeals"}
  before_filter :redirect_to_paypal_confirmation

  layout proc { session[:layout] }

  def authorize_with_http_basic_for_staging
    if Rails.env.staging?
      authenticate_or_request_with_http_basic do |user_name, password|
        user_name == "fairleads" && password == "staging"
      end
      warden.custom_failure! if performed?
    end
  end

  before_filter :set_locale

  helper_method :locale

  def redirect_to_paypal_confirmation
    if user_signed_in? and current_user and current_user.subscription_required? and current_user.active_subscription.unconfirmed_paypal? and !current_user.active_subscription.is_today_in_free_period?
      redirect_to unconfirmed_paypal_subscriptions_path
    end
  end

  def prepare_search
    @search ||= Deal.scoped_search
  end

  def is_current_user_on_correct_domain?
    (session[:site] == current_user.site.to_s) or current_user.admin?
  end

  def redirect_to_correct_site
    if user_signed_in? and current_user and !is_current_user_on_correct_domain? and current_user.domain.present?
      key = current_user.generate_login_key!
      sign_out(current_user)
      if Rails.env.staging?
        redirect_to "http://#{current_user.domain.name}/login_keys/?key=#{key}"
      else
        redirect_to "http://www.#{current_user.domain.name}/login_keys/?key=#{key}"
      end
    end
  end

  def update_log_entries
    if user_signed_in? and self.class.to_s != "UserSessionLogController"
      UserSessionLog.update_end_time(session[:current_usl_global], Settings.logout_time.to_i) if session[:current_usl_global].present?

      other_user_id = params[:other_user_id] || session[:other_user_id]
      logged_as_other_user = ( (current_user and (current_user.admin? or current_user.call_centre?)) and (other_user_id and (other_user_id.to_i != current_user.id)) )
      if self.class.name.match(/::AgentWorkScreen/) and params[:campaign_id] and !logged_as_other_user
        if active_usl = UserSessionLog.active_for_user_and_campaign(current_user, params[:campaign_id])
          session[:current_usl_campaigns] = active_usl.id
          UserSessionLog.update_end_time(session[:current_usl_campaigns], Settings.logout_time.to_i)
        else
          campaign = Campaign.find(params[:campaign_id])
          usl_campaign = UserSessionLog.create(:user_id => current_user.id, :start_time => Time.now,
                                               :end_time => (Time.now + Settings.logout_time.to_i.minutes),
                                               :log_type => UserSessionLog::TYPE_CAMPAIGN,
                                               :euro_billing_rate => campaign.cost_type == Campaign::AGENT_BILLING_RATE_COST ? current_user.euro_billing_rate :
                                                   campaign.cost_type == Campaign::FIXED_HOURLY_RATE_COST ? campaign.euro_fixed_cost_value : nil,
                                               :campaign_id => params[:campaign_id])
          session[:current_usl_campaigns] = usl_campaign.id
        end
      else
        unless session[:current_usl_campaigns].blank?
          UserSessionLog.close_all_campaign_logs_for_user(current_user)
          session[:current_usl_campaigns] = nil
        end
      end
    end

  end

  #Always cast default role class if outside of any namespace
  def current_user
    super && super.send(:casted_class).find(super.id)
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      usl = UserSessionLog.create(:user_id => resource.id, :start_time => Time.now, :end_time => (Time.now + Settings.logout_time.to_i.minutes), :log_type => UserSessionLog::TYPE_REGULAR, :euro_billing_rate => current_user.euro_billing_rate)
      session[:current_usl_global] = usl.id
      if session[:user_requested_url].present?
        if session[:lead_id].to_i > 0 and resource.has_any_role?(:supplier, :lead_supplier)
          lead = Lead.find_by_id(session[:lead_id])
          supplier = User::LeadSupplier.find(resource.id)
          if lead and !Lead.owned_by(supplier).include?(lead)
            if session[:buyout] == "true"
              supplier.cart.buyout_lead(lead)
            else
              supplier.cart.add_lead(lead)
            end
          end
        end
        requested_path = session[:user_requested_url]
        session[:user_requested_url] = nil
        session[:lead_id] = nil
        session[:buyout] = nil
        requested_path
      elsif resource.contact.present? and resource.has_any_role?(:category_supplier, :supplier, :member) and resource.sign_in_count == 1
        my_profile_path
      elsif resource.has_role? :member and session[:site] == "fairdeals"
        root_path
      elsif resource.has_role? :category_supplier
        if resource.with_role.parent_buying_categories.first
          category_home_page_path(resource.with_role.parent_buying_categories.first.cached_slug)
        else
          flash[:notice] = t("common.no_categories_for_category_supplier")
          sign_out(resource_name)
          root_path
        end
      elsif session[:last_url_before_logout].present? and !current_user.has_any_role?(:agent, :call_centre, :call_centre_agent, :member, :supplier, :lead_supplier, :admin)
        last_url = session[:last_url_before_logout]
        session[:last_url_before_logout] = nil
        last_url
      elsif resource.has_role? :admin
        administration_root_path
      elsif [:supplier, :lead_supplier, :lead_user].include?(resource.role)
        supplier_home_path
      elsif [:agent, :call_centre, :call_centre_agent].include?(resource.role)
        agent_home_path
      elsif resource.has_role? :member
        member_home_path
      else
        self.send "#{resource.role.to_s.pluralize}_root_path"
      end
    else
      super
    end
  end

  def after_sign_out_path_for(resource)
    role = session[:logout_user_role].to_s
    session[:logout_user_role] = nil

    if ["supplier", "lead_supplier", "category_supplier", "lead_user"].include?(role)
      supplier_home_path
    elsif ["agent", "call_centre", "call_centre_agent"].include?(role)
      agent_home_path
    else
      root_path
    end
  end

  def set_locale(locale_code=nil)
    @locales = Locale.enabled.all
    session[:locale_code] = locale_code || session[:locale_code] || I18n.locale.to_s
    I18n.locale = @locales.map(&:code).include?(session[:locale_code]) ? session[:locale_code] : @locales.first.code
    Thread.current[:globalize_detailed_locale] = ((user_signed_in? and current_user) and current_user.with_role.address.present?) ? current_user.with_role.address.country.detailed_locale : browser_locale
  end

  def locale
    @locale ||= I18n.locale
  end

  def browser_locale
    accept_lang = request.env['HTTP_ACCEPT_LANGUAGE'] || ""
    (accept_lang.scan(/^([a-z]{2})-([a-z]{2})/).first.blank? ? accept_lang.scan(/^([a-z]{2})/) : accept_lang.scan(/^([a-z]{2})-([a-z]{2})/)).flatten.last

  end

  def set_user_time_zone
    Time.zone = current_user.time_zone if user_signed_in?
  end

  def redirect_to_root_path_if_signed_in
    if user_signed_in? and !current_user.has_any_role?(:admin, :translator)
      method_path = current_user.has_role?(:admin) ? "administration_root_path" : "#{current_user.role.to_s.pluralize}_root_path"
      redirect_to self.send(method_path)
    end
  end

  def category_from_slug
    if params[:slug] and category = Category.where(:cached_slug => params[:slug]).first
      category
    elsif params[:slug]
      redirect_to root_path
    end
  end

  def check_category_supplier
    requested_category = category_from_slug
    @home_category = if user_signed_in? and current_user and current_user.has_role?(:category_supplier)
                       if requested_category and current_user.with_role.parent_accessible_categories.include?(requested_category)
                         requested_category
                       elsif requested_category
                         redirect_to category_home_page_path(current_user.with_role.parent_buying_categories.first.cached_slug)
                       elsif current_user.has_role?(:category_supplier)
                         current_user.with_role.parent_accessible_categories_without_auto_buy.first
                       end
                     elsif requested_category
                       requested_category
                     end
  end

  Warden::Manager.before_failure do |env, opts|
    params = Rack::Request.new(env).params
    session = env['rack.session']
    session[:user_requested_url] = params["requested_url"]
    if params["requested_url"].to_s.include?("/categories") or params["requested_url"].to_s.include?("/leads")
      session[:lead_id] = params["id"]
      session[:buyout] = params["buyout"]
    end

    params[:action] = :unauthenticated
    params[:warden_failure] = opts
  end

  Warden::Manager.before_logout do |user, auth, opts|
    session = auth.request.env['rack.session']
    session[:last_url_before_logout] = auth.request.headers["Referer"]
    session[:show_cart_hint] = nil
    [:current_usl_global, :current_usl_campaigns].each do |key|
      unless session[key].blank?
        UserSessionLog.update_end_time(session[key])
        session[key] = nil
      end
    end
    session[:logout_user_role] = user.role if user
  end

  def current_user_queue
    (user_signed_in? and current_user) ? current_user.queue : "guest"
  end

  def authorize_admin
    raise CanCan::AccessDenied unless current_user and current_user.has_role? :admin
  end


end

