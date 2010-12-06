class LeadUsers::LeadUserController < SecuredController
  def current_user
    @lead_user ||= ::User::LeadUser.find_by_id(super.id)
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:lead_user)
  end
end
