class SurveyQuestion < ActiveRecord::Base

  has_many :survey_options, :dependent => :destroy
  has_many :survey_answers, :dependent => :destroy
  has_many :branched_questions, :class_name => "SurveyQuestion", :foreign_key => "parent_id", :order => "position"
  belongs_to :branched_option, :class_name => "SurveyOption", :foreign_key => "branch_option_id"
  belongs_to :survey

  accepts_nested_attributes_for :survey_options

  acts_as_list :scope => :survey_id

  validates_presence_of :title, :unless => Proc.new { |sq| sq.is_of_type?(:break_page) }
  validates_presence_of :branch_option_id, :if => Proc.new { |sq| sq.parent_id.present? }

  attr_accessor :tmp_position

  after_create :move_to_tmp_position

  TEXT_TYPE = 1.freeze
  NUMBER_TYPE = 2.freeze
  DATE_TYPE = 3.freeze
  SELECT_TYPE = 4.freeze
  HEADING_TYPE = 5.freeze
  BREAK_PAGE_TYPE = 6.freeze

  QUESTION_TYPES = [
      TEXT_TYPE,
      NUMBER_TYPE,
      DATE_TYPE,
      SELECT_TYPE,
      HEADING_TYPE,
      BREAK_PAGE_TYPE
  ].freeze

  scope :without_nested, where(:parent_id => nil)
  scope :with_input_types, where("question_type NOT IN (?)", [HEADING_TYPE, BREAK_PAGE_TYPE])

  include CommonSurvey

  translates :title

  def parent
    SurveyQuestion.find_by_id(parent_id)
  end

  def closest_page_break_id
    survey.survey_questions.where("position >= ?", position).where(:question_type => BREAK_PAGE_TYPE).first.try(:id) || 0
  end

  private

  def move_to_tmp_position
    send(:insert_at_position, tmp_position.to_i) if tmp_position.to_i > 0
  end
end
