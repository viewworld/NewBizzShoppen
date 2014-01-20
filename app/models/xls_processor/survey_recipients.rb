class XlsProcessor::SurveyRecipients < XlsProcessor::Core
  attr_accessor :survey

  def initialize(*args)
    options = args.extract_options!
    @survey = options[:survey]
    @current_user = options[:current_user]
    @directory = 'public/system/survey_recipients'
    @download_path = "surveys_management/surveys/#{survey.id}/survey_recipients_export"
    @email_template = :survey_recipients
    @file_name = 'survey_recipients'
    @template = 'surveys_management/survey_recipients/export.xls'
    @use_delayed_job = true
  end

  private

  def locals
    {:survey => survey,
     :survey_recipients => SurveyRecipient.for_survey(survey).with_state(SurveyRecipient::STATE_COMPLETED).
         includes(:recipient => :country, :survey_answers => {:survey_options => :translations})}
  end
end
