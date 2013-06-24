class SurveysManagement::SurveyRecipientsController < SurveysManagement::SurveysManagementController
  inherit_resources
  before_filter :fetch_survey, :only => [:index, :show, :export]

  set_tab "campaigns"
  set_subtab "surveys"

  def export
    @survey_recipients = SurveyRecipient.for_survey(@survey).with_state(SurveyRecipient::STATE_COMPLETED)

    respond_to do |format|
      format.xls { send_data render_to_string, :filename => "survey_responses.xls" }
    end
  end

  protected

  def collection
    @search = SurveyRecipient.scoped_search(params[:search])
    @search.for_survey = @survey
    @search.with_state = SurveyRecipient::STATE_COMPLETED
    @survey_recipients = @search.order("id").paginate(:show_all => params[:show_all], :page => params[:page], :per_page => SurveyRecipient.per_page)
  end

  def fetch_survey
    @survey = Survey.find(params[:survey_id])
  end
end