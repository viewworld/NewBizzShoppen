class CallResultField < ActiveRecord::Base
  belongs_to :call_result
  belongs_to :campaigns_result_field

  validates_uniqueness_of :campaigns_result_field_id, :scope => :call_result_id
  validates_numericality_of :dynamic_euro_value, :allow_blank => true
end