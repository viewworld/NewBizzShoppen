class SurveyQuestion < ActiveRecord::Base

  has_many :survey_options
  has_many :survey_answers
end
