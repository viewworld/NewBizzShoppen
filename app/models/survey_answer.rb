class SurveyAnswer < ActiveRecord::Base

  has_and_belongs_to_many :survey_options
  belongs_to :survey_question
  belongs_to :survey_recipient

  validates_presence_of :value, :if => Proc.new { |sa| !sa.is_select_type? and sa.is_required? }
  validates_presence_of :survey_option_ids, :if => Proc.new { |sa| sa.is_select_type? and sa.is_required? }
  validates_numericality_of :value, :if => Proc.new { |sa| sa.is_number_type? and (sa.is_filled? or sa.is_required?) }

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
      value_or_option_ids.present? and chosen_branched_question?
    else
      value_or_option_ids.present?
    end
  end

  def value_or_option_ids
    if is_select_type?
      survey_option_ids
    else
      value
    end
  end

  def chosen_branched_question?
    ActiveRecord::ConnectionAdapters::Column.value_to_boolean(chosen_branched_question)
  end
end