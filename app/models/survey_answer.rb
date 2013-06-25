class SurveyAnswer < ActiveRecord::Base

  has_and_belongs_to_many :survey_options
  belongs_to :survey_question
  belongs_to :survey_recipient

  validates_presence_of :value, :if => Proc.new { |sa| !sa.is_select_type? and sa.is_required? }
  validates_presence_of :survey_option_ids, :if => Proc.new { |sa| sa.is_select_type? and sa.is_required? }
  validates_numericality_of :value, :if => Proc.new { |sa| sa.is_number_type? and (sa.is_filled? or sa.is_required?) }

  scope :ordered_by_questions, joins(:survey_question).order("survey_questions.position")

  attr_accessor :chosen_branched_question

  include CommonSurvey

  def is_required?
    if survey_question.parent
      chosen_branched_question? and survey_question.is_required?
    else
      survey_question.is_required?
    end
  end

  def is_filled?
    if survey_question.parent_id.present?
      value_or_options.present? and chosen_branched_question?
    else
      value_or_options.present?
    end
  end

  def value_or_options
    if is_select_type?
      survey_options.map(&:title).join
    else
      value
    end
  end

  def to_s
    "#{survey_question.title}: #{value_or_options}"
  end

  def chosen_branched_question?
    ActiveRecord::ConnectionAdapters::Column.value_to_boolean(chosen_branched_question)
  end
end
