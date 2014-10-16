class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter do
    $request = request
  end

  before_filter :redirect_to_correct_site
  before_filter :authorize_with_http_basic_for_staging, :check_category_supplier, :update_log_entries, :set_user_time_zone
  before_filter :prepare_search, :if => proc{session[:site]=="fairdeals"}
  before_filter :redirect_to_paypal_confirmation

  layout proc { |_| session[:layout] }

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
    if current_user && current_user.subscription_required? && current_user.active_subscription.unconfirmed_paypal? && !current_user.active_subscription.is_today_in_free_period?
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
    if current_user && !is_current_user_on_correct_domain? && current_user.domain.present?
      key = current_user.generate_login_key!
      sign_out(current_user)
      redirect_to "http://#{current_user.domain.name_for_env}/login_keys/?key=#{key}"
    end
  end

  def logged_as_other_user?
    other_user_id = params[:other_user_id] || session[:other_user_id]
    (current_user and (current_user.admin? or current_user.call_centre?)) and (other_user_id and (other_user_id.to_i != current_user.id))
  end

  def update_log_entries
    if user_signed_in? && !UserSessionLog::EXCLUDED_CONTROLLERS.include?(self.class.to_s) && current_user
      UserSessionLog.update_regular_time(current_user)
      if (self.class.name.match(/::AgentWorkScreen/) or UserSessionLog::CAMPAIGN_CONTROLLERS.include?(self.class.to_s)) and params[:campaign_id] and !logged_as_other_user?
        UserSessionLog.update_campaign_time(current_user, params[:campaign_id])
      elsif !UserSessionLog::IGNORED_CONTROLLERS.include?(self.class.to_s)
        UserSessionLog.close_all_campaign_logs_for_user(current_user)
      end
    end
  end

  #Always cast default role class if outside of any namespace
  def current_user
    super && super.send(:casted_class).find(super.id)
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
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
        if resource.with_role.parent_accessible_categories_without_auto_buy.first
          category_home_page_path(resource.with_role.parent_accessible_categories_without_auto_buy.order("category_translations.name").select('category_translations.name').first.cached_slug)
        elsif resource.with_role.parent_accessible_categories.first
          category_home_page_path(resource.with_role.parent_accessible_categories.first.cached_slug)
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

    if role == "category_supplier" and @home_category
      category_home_page_path(@home_category.cached_slug)
    elsif ["supplier", "lead_supplier", "category_supplier", "lead_user"].include?(role)
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
    I18n.locale = @locales.map(&:code).include?(session[:locale_code]) ? session[:locale_code] : 'da'
    set_globalize_detailed_locale
  end

  def set_globalize_detailed_locale
    Thread.current[:globalize_detailed_locale] = if user_signed_in? && current_user && current_user.with_role.address.present?
                                                   current_user.with_role.address.country.detailed_locale
                                                 else
                                                   browser_locale
                                                 end
  end

  def locale
    @locale ||= I18n.locale
  end

  def browser_locale
    accept_lang = request.env['HTTP_ACCEPT_LANGUAGE'] || ""
    (accept_lang.scan(/^([a-z]{2})-([a-z]{2})/).first.blank? ? accept_lang.scan(/^([a-z]{2})/) : accept_lang.scan(/^([a-z]{2})-([a-z]{2})/)).flatten.last
  end

  def set_user_time_zone
    Time.zone = current_user.time_zone if user_signed_in? and current_user
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
                         if home_category = current_user.with_role.parent_accessible_categories_without_auto_buy.order("category_translations.name").select('category_translations.name').first and home_category
                           home_category
                         else
                           current_user.with_role.parent_accessible_categories.first
                         end
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
    UserSessionLog.close_all_logs_for_user(user)
    session[:logout_user_role] = user.role if user
  end

  def current_user_queue
    (user_signed_in? and current_user) ? current_user.queue : "guest"
  end

  def authorize_admin
    raise CanCan::AccessDenied unless current_user and current_user.has_role? :admin
  end
end
