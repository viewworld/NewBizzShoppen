class Newsletters::NewslettersController < SecuredController
  def current_user
    user = super
    if user
      @user ||= ::User::CallCentre.find_by_id(user.id)
      @user ||= ::User::Admin.find_by_id(user.id)
    end
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:call_centre, :admin)
  end
end
