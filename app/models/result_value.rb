class ResultValue < ActiveRecord::Base

  belongs_to :result_field
  belongs_to :call_result

  validates_presence_of :value, :if => Proc.new { |rv| rv.result_field.is_mandatory }

  before_create :duplicate_field_type

  def duplicate_field_type
    self.field_type = result_field.field_type
  end

end
