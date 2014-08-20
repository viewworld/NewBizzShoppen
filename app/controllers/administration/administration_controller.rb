class Administration::AdministrationController < SecuredController
  def current_user
    user = super

    if user
      @admin ||= ::User::Admin.find_by_id(user.id)
      @admin ||= User.find_by_id(user.id).with_role
    end
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:admin)
  end

end
