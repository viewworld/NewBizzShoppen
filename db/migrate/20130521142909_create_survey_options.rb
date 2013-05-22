class CreateSurveyOptions < ActiveRecord::Migration
  def self.up
    create_table :survey_options do |t|
      t.integer :survey_question_id
      t.string :title
      t.timestamps
    end
  end

  def self.down
    drop_table :survey_options
  end
end
