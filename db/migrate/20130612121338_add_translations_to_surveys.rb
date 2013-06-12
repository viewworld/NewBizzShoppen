class AddTranslationsToSurveys < ActiveRecord::Migration
  def self.up
    SurveyQuestion.create_translation_table! :title => :string
    SurveyOption.create_translation_table! :title => :string
  end

  def self.down
    SurveyQuestion.drop_translation_table!
    SurveyOption.drop_translation_table!
  end
end
