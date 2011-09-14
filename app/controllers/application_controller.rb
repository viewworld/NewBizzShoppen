class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :redirect_to_fairleads
  before_filter :authorize_with_http_basic_for_staging, :check_category_buyer, :update_log_entries, :set_user_time_zone
  after_filter :do_something

  layout proc{|c| session[:site] ? "layouts/#{session[:site]}/application" : "layouts/fairleads/application" }

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

  def redirect_to_fairleads
    if user_signed_in? and current_user and !current_user.has_role? :purchase_manager and session[:site] == "fairdeals"
      key = current_user.generate_login_key!
      sign_out(current_user)
      redirect_to "http://#{Rails.env == 'staging' ? 'beta.fairleads.com' : 'fairleads.com'}/login_keys/?key=#{key}"
    end
  end

  def update_log_entries
    if user_signed_in? and self.class.to_s != "UserSessionLogController"
      UserSessionLog.update_end_time(session[:current_usl_global], Settings.logout_time.to_i) if session[:current_usl_global].present?
      if self.class.name.match(/::AgentWorkScreen/) and params[:campaign_id]
        if session[:current_usl_campaigns].blank? or UserSessionLog.find(session[:current_usl_campaigns]).campaign_id != params[:campaign_id].to_i
          usl_campaign = UserSessionLog.create(:user_id => current_user.id, :start_time => Time.now,
                                               :end_time => (Time.now + Settings.logout_time.to_i.minutes),
                                               :log_type => UserSessionLog::TYPE_CAMPAIGN,
                                               :euro_billing_rate => current_user.euro_billing_rate,
                                               :campaign_id => params[:campaign_id])
          session[:current_usl_campaigns] = usl_campaign.id
        else
          UserSessionLog.update_end_time(session[:current_usl_campaigns], Settings.logout_time.to_i)
        end
      else
        unless session[:current_usl_campaigns].blank?
          UserSessionLog.update_end_time(session[:current_usl_campaigns])
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
        if session[:lead_id].to_i > 0 and resource.has_any_role?(:customer, :lead_buyer)
          lead = Lead.find_by_id(session[:lead_id])
          buyer = User::LeadBuyer.find(resource.id)
          if lead and !Lead.owned_by(buyer).include?(lead)
            if session[:buyout] == "true"
              buyer.cart.buyout_lead(lead)
            else
              buyer.cart.add_lead(lead)
            end
          end
        end
        requested_path = session[:user_requested_url]
        session[:user_requested_url] = nil
        session[:lead_id] = nil
        session[:buyout] = nil
        requested_path
      elsif resource.contact.present? and resource.has_any_role?(:category_buyer, :customer, :purchase_manager) and resource.sign_in_count == 1
        my_profile_path
      elsif resource.has_role? :purchase_manager and session[:site] == "fairdeals"
        root_path
      elsif resource.has_role? :category_buyer
        if resource.with_role.parent_buying_categories.first
          category_home_page_path(resource.with_role.parent_buying_categories.first.cached_slug)
        else
          flash[:notice] = t("common.no_categories_for_category_buyer")
          sign_out(resource_name)
          root_path
        end
      elsif session[:last_url_before_logout].present? and !current_user.has_any_role?(:agent, :call_centre, :call_centre_agent, :purchase_manager, :customer, :lead_buyer)
        last_url = session[:last_url_before_logout]
        session[:last_url_before_logout] = nil
        last_url
      elsif resource.has_role? :admin
        administration_root_path
      elsif [:customer, :lead_buyer, :lead_user].include?(resource.role)
        buyer_home_path
      elsif [:agent, :call_centre, :call_centre_agent].include?(resource.role)
        agent_home_path
      elsif resource.has_role? :purchase_manager
        purchase_manager_home_path
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

    if ["customer", "lead_buyer", "category_buyer", "lead_user"].include?(role)
      buyer_home_path
    elsif ["agent", "call_centre", "call_centre_agent"].include?(role)
      agent_home_path
    elsif role == "purchase_manager"
      purchase_manager_home_path
    else
      root_path
    end
  end

  def set_locale(locale_code=nil)
    @locales = Locale.enabled.all
    session[:locale_code] = locale_code || session[:locale_code] || I18n.locale.to_s
    I18n.locale = session[:locale_code]
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
    #Time.zone = current_user.time_zone if user_signed_in?
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

  def check_category_buyer
    requested_category = category_from_slug
    @home_category = if user_signed_in? and current_user and current_user.has_role?(:category_buyer)
                       if requested_category and current_user.with_role.parent_accessible_categories.include?(requested_category)
                         requested_category
                       elsif requested_category
                         redirect_to category_home_page_path(current_user.with_role.parent_buying_categories.first.cached_slug)
                       elsif current_user.has_role?(:category_buyer)
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

  def do_something
#    require 'nokogiri'
#    doc = Nokogiri::HTML(response_body)
#    throw doc
  end

end

