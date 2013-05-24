class SurveyQuestion < ActiveRecord::Base

  has_many :survey_options, :dependent => :destroy
  has_many :survey_answers, :dependent => :destroy

  belongs_to :survey

  accepts_nested_attributes_for :survey_options

  acts_as_list :scope => [:survey_id, :parent_id]

  validates_presence_of :title

  attr_accessor :tmp_position

  after_create :move_to_tmp_position

  TEXT_TYPE = 1.freeze
  NUMBER_TYPE = 2.freeze
  DATE_TYPE = 3.freeze
  SELECT_TYPE = 4.freeze

  QUESTION_TYPES = [
    TEXT_TYPE,
    NUMBER_TYPE,
    DATE_TYPE,
    SELECT_TYPE
  ].freeze

  def is_text_type?
    question_type == TEXT_TYPE
  end

  def is_select_type?
    question_type == SELECT_TYPE
  end

  private

  def move_to_tmp_position
    send(:insert_at_position, tmp_position.to_i) if tmp_position.to_i > 0
  end
end
