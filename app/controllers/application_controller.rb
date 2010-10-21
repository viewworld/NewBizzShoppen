class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  helper_method :locale

  def after_sign_in_path_for(resource)
     if resource.is_a?(User)
       if resource.has_role? :admin
        administration_root_path
       elsif resource.has_role? :customer or resource.has_role? :lead_buyer and resource.sign_in_count <= 1
         edit_buyer_interests_path
       else
        self.send "#{resource.roles.first.to_s}_root_path"
       end
     else
       super
     end
  end

  def set_locale(locale=nil)
    if locale.nil?
      locale_code = session[:locale_code].blank? ? I18n.locale.to_s : session[:locale_code]
      @locale = Locale.new(locale_code)
    else
      @locale = locale
      session[:locale_code] = @locale.code
    end
    I18n.locale = @locale.code
    @locales = Locale.all
    @locale
  end

  def locale
    @locale || set_locale
  end

end
