class CreateSurveyAnswers < ActiveRecord::Migration
  def self.up
    create_table :survey_answers do |t|
      t.string :value
      t.integer :survey_question_id
      t.integer :survey_recipient_id
      t.integer :question_type
      t.timestamps
    end

    create_table :survey_answers_survey_options, :id => false do |t|
      t.integer :survey_answer_id
      t.integer :survey_option_id
    end
  end

  def self.down
    drop_table :survey_answers
  end
end
