class SurveysManagement::SurveysManagementController < SecuredController
  def current_user
    if user_signed_in?
      @user ||= ::User::Admin.find_by_id(super.id)
    end
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:admin)
  end
end