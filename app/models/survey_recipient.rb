class SurveyRecipient < ActiveRecord::Base

  has_many :survey_answers
  belongs_to :survey

  accepts_nested_attributes_for :survey_answers, :allow_destroy => true

  validates_presence_of :survey_id, :email

  before_create :set_uuid
  before_save :mark_empty_survey_answers_for_removal

  def survey_link
    "survey#{uuid}"
  end

  def build_answer(question)
    self.survey_answers.build(:survey_question => question, :survey_recipient => self, :question_type => question.question_type)
  end

  def build_survey_answers_ordered
    ordered_answers = []
    survey.survey_questions.without_nested.each do |question|
      ordered_answers << build_answer(question)
      if question.is_branched?
        question.branched_questions.each do |branched_question|
          ordered_answers << build_answer(branched_question)
        end
      end
    end

    ordered_answers
  end

  def answered_survey?
    survey_answers.any?
  end

  def visited!
    update_attribute(:visited_at, Time.now) unless visited_at
  end

  def completed!
    update_attribute(:completed_at, Time.now) unless completed_at
  end

  private

  def mark_empty_survey_answers_for_removal
    survey_answers.each do |survey_answer|
      survey_answer.mark_for_destruction if (survey_answer.survey_question.parent_id.present? and !survey_answer.chosen_branched_question?) or (!survey_answer.is_required? and !survey_answer.is_filled?)
    end
  end

  def set_uuid
    self.uuid = SecureRandom.hex(18)
  end
end
