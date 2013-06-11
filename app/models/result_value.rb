class ResultValue < ActiveRecord::Base

  belongs_to :result_field
  belongs_to :call_result

  validates_presence_of :value, :if => Proc.new { |rv| rv.result_field.is_mandatory }
  validate :value_format

  before_create :duplicate_field_type, :unless => :save_without_callbacks

  scope :for_result_field, lambda {|result_field| where(:result_field_id => result_field)}
  scope :dates, where(:field_type => ResultField::DATETIME.to_s)

  def duplicate_field_type
    self.field_type = result_field.field_type
  end

  def materials
    Material.where(:id => value.to_s.split(","))
  end

  def material_id
    value.to_i
  end

  def material_id=(_material_id)
    self.value = _material_id
  end

  def survey_recipient
    Contact.find(value).survey_recipients.detect { |sr| sr.survey_id == result_field.survey_id }
  end

  def survey_answers
    survey_recipient ? survey_recipient.survey_answers : []
  end

  private
  def value_format
    return true if !result_field.is_mandatory and value.blank?
    case result_field.field_type.to_i
      when ResultField::DATE then
        errors.add(:value, :incorrect_date_format) unless /^(19|20)\d\d-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/.match value.strip
      when ResultField::DATETIME then
        errors.add(:value, :incorrect_datetime_format) unless /^(19|20)\d\d-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01]) ([0-1][0-9]|2[0-3]):([0-5][0-9])$/.match value.strip
      when ResultField::INTEGER then
        errors.add(:value, :incorrect_number_format) unless /^[-+]?[\d]+$/.match value.strip
      when ResultField::SURVEY then
        errors.add(:value, :survey_not_filled_out_or_sent) if survey_recipient.nil? or (!survey_recipient.sent? and !survey_recipient.completed?)
    end
  end

end
