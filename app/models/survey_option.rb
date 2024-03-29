class SurveyOption < ActiveRecord::Base
  CSV_ATTRS = %w(title)

  has_and_belongs_to_many :survey_answers
  belongs_to :survey_question
  belongs_to :chain_mail_type
  belongs_to :category

  validates_presence_of :title

  translates :title

  acts_as_taggable

  def to_s
    title
  end
end
