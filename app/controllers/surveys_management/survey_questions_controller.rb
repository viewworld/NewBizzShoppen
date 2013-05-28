class SurveysManagement::SurveyQuestionsController < SurveysManagement::SurveysManagementController
  before_filter :fetch_survey, :except => [:sort]

  def new
    @survey_question = @survey.survey_questions.new(:question_type => params[:question_type], :tmp_position => params[:position], :parent_id => params[:parent_id])
    render :partial => 'new', :layout => false
  end

  def create
    @survey_question = @survey.survey_questions.new(params[:survey_question])
  end

  def edit
    @survey_question = @survey.survey_questions.find(params[:id])
    @survey_question.parent_id = params[:parent_id] if params[:parent_id].present?
    render :partial => 'edit', :layout => false
  end

  def update
    @survey_question = @survey.survey_questions.find(params[:id])
  end

  def destroy
    @survey_question = @survey.survey_questions.find(params[:id])
  end

  def remove_parent
    @survey_question = @survey.survey_questions.find(params[:id])
    SurveyQuestion.update_all({ :parent_id => nil, :branch_option_id => nil }, ["id = ?", @survey_question.id])
    render :nothing => true
  end

  def sort
    params[:ids].each_with_index do |id, index|
      SurveyQuestion.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end

  protected

  def fetch_survey
    @survey = Survey.find(params[:survey_id])
  end
end