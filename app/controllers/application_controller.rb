class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize_with_http_basic_for_staging, :check_category_buyer

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

  #Always cast default role class if outside of any namespace
  def current_user
    super && super.send(:casted_class).find(super.id)
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      if session[:user_requested_url].present?
        if session[:lead_id].to_i > 0 and resource.has_any_role?(:customer, :lead_buyer)
          lead = Lead.find_by_id(session[:lead_id])
          buyer = User::LeadBuyer.find(resource.id)
          buyer.cart.add_lead(lead) if lead and !Lead.owned_by(buyer).include?(lead)
        end
        requested_path = session[:user_requested_url]
        session[:user_requested_url] = nil
        session[:lead_id] = nil
        requested_path
      elsif resource.has_role? :customer and resource.sign_in_count <= 1
        edit_customers_interests_path
      elsif resource.has_role? :category_buyer
        category_home_page_path(resource.with_role.parent_buying_categories.first.cached_slug)
      elsif session[:last_url_before_logout].present?
        last_url = session[:last_url_before_logout]
        session[:last_url_before_logout] = nil
        last_url
      elsif resource.has_role? :admin
        administration_root_path
      elsif resource.role == :lead_buyer
        buyers_root_path
      else
        self.send "#{resource.role.to_s.pluralize}_root_path"
      end
    else
      super
    end
  end

  def set_locale(locale_code=nil)
    @locales = Locale.all
    session[:locale_code] = locale_code || session[:locale_code] || I18n.locale.to_s
    I18n.locale = session[:locale_code]
  end

  def locale
    @locale ||= I18n.locale
  end

  def redirect_to_root_path_if_signed_in
    if user_signed_in?
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
        current_user.with_role.parent_buying_categories.first
      end
    elsif requested_category
      requested_category
    end
  end

  Warden::Manager.before_failure do |env, opts|
    params = Rack::Request.new(env).params
    session = env['rack.session']
    session[:user_requested_url] = params["requested_url"]
    session[:lead_id] = params["id"] if params["requested_url"].to_s.include?("/categories") or params["requested_url"].to_s.include?("/leads")

    params[:action] = :unauthenticated
    params[:warden_failure] = opts
  end

  Warden::Manager.before_logout do |user,auth,opts|
    session = auth.request.env['rack.session']
    session[:last_url_before_logout] = auth.request.headers["Referer"]
  end
end

