class SurveysManagement::SurveyRecipientsExportController < SurveysManagement::SurveysManagementController
  before_filter :fetch_survey, :only => [:create, :show]

  def create
    respond_to do |format|
      format.xls do
        result = XlsProcessor::SurveyRecipients.new(:current_user => current_user,
                                                    :survey => @survey).process
        if result
          send_data result, :filename => 'survey_responses.xls'
        else
          flash[:notice] = I18n.t('surveys_management.survey_recipients_export.create.flash.notice.success')
          redirect_to surveys_management_survey_survey_recipients_path(@survey)
        end
      end
    end
  end

  def show
    if @survey.can_be_managed_by?(current_user)
      send_file Rails.root.join("public/system/survey_recipients/#{current_user.id}/#{params[:file]}"), :filename => params[:file]
    else
      flash[:alert] = I18n.t('surveys_management.survey_recipients_export.show.flash.alert.failure')
      redirect_to root_path
    end
  end
end
