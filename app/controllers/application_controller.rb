class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  helper_method :locale

  #Always cast default role class if outside of any namespace
  def current_user
    super && super.send(:casted_class).find(super.id)
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      if resource.has_role? :admin
        administration_root_path
      elsif resource.has_role? :customer or resource.has_role? :lead_buyer and resource.sign_in_count <= 1
        edit_buyers_interests_path
      else
        self.send "#{resource.roles.first.to_s.pluralize}_root_path"
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
end
