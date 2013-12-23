class AddIndexesToSurveys < ActiveRecord::Migration
  def self.up
    add_index :survey_answers_survey_options, :survey_answer_id
    add_index :survey_options, :survey_question_id
    add_index :survey_answers, :survey_question_id
    add_index :survey_answers, :survey_recipient_id
    add_index :survey_questions, :survey_id
  end

  def self.down
    remove_index :survey_answers_survey_options, :survey_answer_id
    remove_index :survey_options, :survey_question_id
    remove_index :survey_answers, :survey_question_id
    remove_index :survey_answers, :survey_recipient_id
    remove_index :survey_questions, :survey_id
  end
end
