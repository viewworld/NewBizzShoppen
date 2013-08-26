class SurveysManagement::EmailTemplatesController < SurveysManagement::SurveysManagementController
  inherit_resources
  before_filter :fetch_survey

  def update
    update! do |success, failure|
      success.html { redirect_to edit_surveys_management_survey_path(@survey) }
    end
  end

  protected

  def fetch_survey
    @survey = Survey.find(params[:survey_id])
    raise CanCan::AccessDenied unless @survey.can_be_managed_by?(current_user)
  end
end