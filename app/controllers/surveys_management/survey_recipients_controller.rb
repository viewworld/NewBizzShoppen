class SurveysManagement::SurveyRecipientsController < SurveysManagement::SurveysManagementController
  inherit_resources
  before_filter :fetch_survey, :only => [:index, :show]

  set_tab 'campaigns'
  set_subtab 'surveys'

  protected

  def collection
    @search = SurveyRecipient.scoped_search(params[:search])
    @search.for_survey = @survey
    @search.with_state = SurveyRecipient::STATE_COMPLETED
    @survey_recipients = @search.order('id').paginate(:show_all => params[:show_all], :page => params[:page], :per_page => SurveyRecipient.per_page)
  end
end
