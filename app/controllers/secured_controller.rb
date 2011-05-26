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

  def authorize_role(*role)
    raise CanCan::AccessDenied unless current_user and current_user.has_one_of_roles? *role
  end

  def authorize_manage_rights(object)
    raise CanCan::AccessDenied unless object.respond_to? :can_be_managed_by? and object.can_be_managed_by?(current_user) 
  end

  def authorize_access_rights(object)
    raise CanCan::AccessDenied unless object.respond_to? :can_be_accessed_by? and object.can_be_accessed_by?(current_user)
  end

end
