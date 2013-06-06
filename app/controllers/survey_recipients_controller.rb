class SurveyRecipientsController < ApplicationController

  before_filter :fetch_survey

  def show
    @survey_recipient.visited!
    @survey_recipient.build_survey_answers_ordered
  end

  def update
    if @survey_recipient.update_attributes(params[:survey_recipient])
      @survey_recipient.completed!
    else
      render :action => 'show'
    end
  end

  protected

  def fetch_survey
    @survey_recipient = SurveyRecipient.where(:uuid => params[:id]).first
    @survey = @survey_recipient ? @survey_recipient.survey : nil
    if @survey.nil? or @survey_recipient.answered_survey?
      flash[:notice] = @survey.nil? ? I18n.t("surveys.flash.notice.not_found") : I18n.t("surveys.flash.notice.already_answered")
      redirect_to root_path
    end
  end
end