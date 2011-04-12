class ResultField < ActiveRecord::Base

  STRING = 0.freeze
  INTEGER = 1.freeze
  DATE = 2.freeze
  NOTE = 3.freeze
  TIME = 4.freeze
  FIELD_TYPES = [STRING, INTEGER, DATE, NOTE, TIME]

  belongs_to :result
  has_many :result_value

  validates_presence_of :name, :field_type

  def value_for_call_result(call_result)
    rv = ResultValue.first(:conditions => ["call_result_id = ? and result_field_id = ?", call_result.id, id])
    rv.nil? ? "" : rv.value
  end

end
