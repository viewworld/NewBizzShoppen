class CallCentres::CallCentreController < SecuredController
  def current_user
    @call_centre ||= ::User::CallCentre.find_by_id(super.id)
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:call_centre)
  end
end