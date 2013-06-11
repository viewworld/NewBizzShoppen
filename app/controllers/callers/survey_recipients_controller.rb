class Callers::SurveyRecipientsController < Callers::CallerController

  before_filter :fetch_survey, :only => [:edit, :update]

  def new
    @contact = Contact.find(params[:contact_id])
    @survey = Survey.find(params[:survey_id])
    if (current_user.admin? or @contact.campaign.user_ids.include?(current_user.id)) and @contact.campaign.survey_ids.include?(@survey.id)
      @survey_recipient = @survey.create_or_fetch_survey_recipient(@contact, false)

      if params[:email_notification].to_i == 1 and !@survey_recipient.sent?
        @survey_recipient.notify_recipient_by_email
      end
    else
      @survey_recipient = nil
    end
  end

  def edit
    @survey_recipient = SurveyRecipient.where(:uuid => params[:id]).first
    @survey_recipient.visited!
    @survey_recipient.build_survey_answers_ordered
    render :partial => 'edit', :layout => false
  end

  def update

  end

  protected

  def fetch_survey
    @survey_recipient = SurveyRecipient.where(:uuid => params[:id]).first
  end
end