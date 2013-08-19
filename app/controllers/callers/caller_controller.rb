class Callers::CallerController < SecuredController
  def current_user
    authorized_roles.each do |_role|
      @user ||= "::User::#{_role.to_s.camelize}".constantize.find_by_id(super.id)
    end
    @user
  end

  private

  def authorized_roles
    [:call_centre, :call_centre_agent, :admin, :agent]
  end

  def authorize_user_for_namespace!
    authorize_role(*authorized_roles)
  end
end