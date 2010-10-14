class Administration::AdministrationController < SecuredController
  def current_user
    #Second request is cached so only class-casting occurs
    @admin ||= ::User::Admin.find(super.id)
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:admin)
  end

end