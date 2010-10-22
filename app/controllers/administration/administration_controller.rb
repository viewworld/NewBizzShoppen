class Administration::AdministrationController < SecuredController
  def current_user
    @admin ||= ::User::Admin.find(super.id)
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:admin)
  end

end