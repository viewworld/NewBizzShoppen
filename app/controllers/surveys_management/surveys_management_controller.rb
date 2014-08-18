class SurveysManagement::SurveysManagementController < SecuredController
  def current_user
    user = super

    if user
      @user ||= ::User::Admin.find(user.id)
      @user ||= ::User::CallCentre.find(user.id)
      @user ||= ::User::CategorySupplier.find(user.id)
      @user ||= ::User::Supplier.find(user.id)
    end
  end

  private

  def fetch_survey
    @survey = Survey.find(params[:survey_id])
  end
end
