class SurveyQuestion < ActiveRecord::Base

  has_many :survey_options
  has_many :survey_answers

  belongs_to :survey

  acts_as_list :scope => [:survey_id, :parent_id]

  validates_presence_of :title

  attr_accessor :tmp_position

  after_create :move_to_tmp_position

  TEXT_TYPE = 1.freeze
  TEXTAREA_TYPE = 2.freeze
  NUMBER_TYPE = 3.freeze
  DATE_TYPE = 4.freeze
  SINGLE_SELECT_TYPE = 5.freeze
  MULTI_SELECT_TYPE = 6.freeze

  QUESTION_TYPES = [
      TEXT_TYPE,
      TEXTAREA_TYPE,
      NUMBER_TYPE,
      DATE_TYPE,
      SINGLE_SELECT_TYPE,
      MULTI_SELECT_TYPE
  ].freeze

  def move_to_tmp_position
    send(:insert_at_position, tmp_position.to_i) if tmp_position.to_i > 0
  end
end
