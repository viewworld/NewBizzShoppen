class Administration::SuperadminController < SecuredController
  def current_user
    @admin ||= ::User::Admin.find_by_id(super.id)
    @admin ||= User.find_by_id(super.id).with_role
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:superadmin)
  end

end