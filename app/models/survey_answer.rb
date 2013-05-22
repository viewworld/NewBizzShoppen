class SurveyAnswer < ActiveRecord::Base

  has_and_belongs_to_many :survey_options
end
