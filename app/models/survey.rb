class Survey < ActiveRecord::Base

  has_many :survey_questions
  has_many :survey_recipients
end
