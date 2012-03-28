class Newsletters::NewslettersController < SecuredController
  def current_user
    if user_signed_in?
      @user ||= ::User::CallCentre.find_by_id(super.id)
      @user ||= ::User::Admin.find_by_id(super.id)
    end
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:call_centre, :admin)
  end
end