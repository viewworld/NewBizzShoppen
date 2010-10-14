class SecuredController < ApplicationController
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to root_url
  end

  before_filter :authenticate_user!
  before_filter :authorize_user_for_namespace!

  private

  def authorize_user_for_namespace!
    true
  end

  def authorize_role(role)
    raise CanCan::AccessDenied unless current_user.has_role?(role)
  end
end
