class ResultValue < ActiveRecord::Base

  belongs_to :result_field
  belongs_to :call_result
  belongs_to :material, :class_name => 'Material', :primary_key => :id, :foreign_key => :value

  validates_presence_of :value, :if => Proc.new { |rv| rv.result_field.is_mandatory }
  validate :value_format

  before_create :duplicate_field_type

  scope :for_result_field, lambda {|result_field| where(:result_field_id => result_field)}

  def duplicate_field_type
    self.field_type = result_field.field_type
  end

  private
  def value_format
    case result_field.field_type.to_i
      when ResultField::DATE then
        errors.add(:value, :incorrect_date_format) unless /^(19|20)\d\d-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/.match value.strip
      when ResultField::DATETIME then
        errors.add(:value, :incorrect_datetime_format) unless /^(19|20)\d\d-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01]) ([0-1][0-9]|2[0-3]):([0-5][0-9])$/.match value.strip
      when ResultField::INTEGER then
        errors.add(:value, :incorrect_number_format) unless /^[-+]?[\d]+$/.match value.strip
    end
  end

end
