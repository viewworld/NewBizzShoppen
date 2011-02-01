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
        requested_path = session[:user_requested_url]
        session[:user_requested_url] = nil
        requested_path
      elsif resource.has_role? :admin
        administration_root_path
      elsif resource.has_role? :customer and resource.sign_in_count <= 1
        edit_customers_interests_path
      elsif resource.role == :lead_buyer
        buyers_root_path
      elsif resource.has_role? :category_buyer
        category_home_page_path(resource.category.cached_slug)
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

  def check_category_buyer
    category_from_slug = params[:slug] ? Category.where(:cached_slug => params[:slug]).first : nil
    @home_category = if current_user and current_user.has_role?(:category_buyer)
      redirect_to category_home_page_path(current_user.category.cached_slug) if (category_from_slug and category_from_slug != current_user.category) or (params[:slug] and !category_from_slug)
      current_user.category
    elsif params[:slug] and !category_from_slug
      redirect_to root_path
    elsif category_from_slug
      category_from_slug
    end

  end

  Warden::Manager.before_failure do |env, opts|
    params = Rack::Request.new(env).params
    session = env['rack.session']
    session[:user_requested_url] = params["requested_url"]

    params[:action] = :unauthenticated
    params[:warden_failure] = opts
  end

end

