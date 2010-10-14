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
end
