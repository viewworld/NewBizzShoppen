class SurveyOption < ActiveRecord::Base

  has_and_belongs_to_many :survey_answers
  belongs_to :survey_question

  validates_presence_of :title

  translates :title
end
